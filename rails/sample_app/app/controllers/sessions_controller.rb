
class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      remember(user) if params[:sessions][:remember_me] == "1"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Invalid username/password"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'Log out successfully.'
    redirect_to root_path
  end
end
