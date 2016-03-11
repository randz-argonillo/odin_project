class ArticlesController < ApplicationController
  before_action :current_article, only: [:show]

  def index
    @articles = Article.all
  end


  def show
    
  end

  def current_article
    @article = Article.find(params[:id])
  end

end
