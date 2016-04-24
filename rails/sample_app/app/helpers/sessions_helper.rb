module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by( id: session[:user_id]) 
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end

    @current_user
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?    
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def remember(user)
    user.remember
    save_to_cookies :user_id, user.id, signed: true
    save_to_cookies :remember_token, user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def store_request
    session[:forwarding_url] = request.url if request.get?
  end

  def redirect_back_or(default)
    redirect_to (session[:forwarding_url] || default)
    session.delete(:forwarding_url) if session[:forwarding_url]
  end

private
  def save_to_cookies(key, value, options = {})
    if options[:signed]
      cookies.signed.permanent[key] = value
    else 
      cookies.permanent[key] = value
    end
  end

end
