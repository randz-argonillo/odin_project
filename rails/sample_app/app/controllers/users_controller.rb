class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :index]
  before_action :require_correct_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to this App!'
      redirect_to @user

      # flash[:info] = "Please check your email to activate your account." 
      # UserMailer.account_activation(user).deliver
      # redirect_to root_url
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

  def destroy
    user.destroy
    flash[:success] = 'User deleted'
    redirect_to users_path
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

  def require_correct_user
    return if current_user?(user)
    flash[:danger] = "You are not authorize to access the page."
    redirect_to user_path(user)
  end

  def user
    @user ||= User.find(params[:id])
  end

  def require_admin
    return if current_user.admin?
    flash[:danger] = 'You are not authorize.'
    redirect_to root_url 
  end
end
