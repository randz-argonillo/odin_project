module ApplicationHelper
  def require_login
    unless logged_in?
      flash.notice = "You need to login first."
      redirect_to login_path
      false
    end
  end
end
