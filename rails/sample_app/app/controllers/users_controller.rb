class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to this App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    # if logged_in?
    #   @user = current_user
    # else
    #   @user = User.find(params[:id])
    # end

    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if user.update(user_params)
      flash[:success] = 'Profile updated.'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = 'Error'
      render 'edit'
    end
  end
  

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_login
    return if logged_in?
    
    store_request
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def correct_user
    return if current_user?(user)
    flash[:danger] = "You are not authorize to access the page."
    redirect_to user_path(user)
  end

  def user
    @user ||= User.find(params[:id])
  end
end
