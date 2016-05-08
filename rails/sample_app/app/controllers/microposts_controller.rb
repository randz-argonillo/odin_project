class MicropostsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  before_action :require_correct_user, only: [:destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @feed = current_user.feed.paginate(page: params[:page], per_page: 5)
    if @micropost.save
      flash[:info] = "Micropost created."
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
    micropost = Micropost.find(params[:id])
    micropost.destroy
    flash[:success] = "Remove successfully"
    redirect_to request.referrer || root_path
  end

private
  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def require_correct_user
    micropost = current_user.microposts.find_by(id: params[:id])
    if micropost.nil?
      flash[:danger] = "You can't remove post by other people."
      redirect_to request.referrer || root_path
    end
  end

end
