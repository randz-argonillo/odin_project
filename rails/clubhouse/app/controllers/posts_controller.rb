class PostsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @post = @user.posts.build
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post added successfully."
      redirect_to user_post_path(@user, @post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit

  end

private
  def set_user
   @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
