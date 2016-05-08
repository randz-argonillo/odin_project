class StaticPagesController < ApplicationController
  include StaticPagesHelper
  
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed = paginate(current_user.feed, page: params[:page], per_page: 5)
    end
  end
  
  def contact
  end

  def about
  end

  def help
  end
end
