class UsersController < ApplicationController
  # include SessionsHelper

  def new
    @user = User.new
  end

  def show
    if logged_in?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

  def create
    @user = User.new(params[:id])
    if @user.update(user_params)
      log_in @user
      flash[:success] = 'Welcome to this App!'
      redirect_to @user
    else
      render 'new'
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
