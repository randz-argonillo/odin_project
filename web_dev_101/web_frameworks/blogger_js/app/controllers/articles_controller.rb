class ArticlesController < ApplicationController
  include ArticlesHelper
  include ApplicationHelper

  before_filter :require_login, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @current_user = current_user
    @comment = Comment.new(article_id: @article.id)
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.author = current_user
    article.save
    flash.notice = "Added new article '#{article.title}'"
    redirect_to article_path(article)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash.notice = "#{article.title} has been removed."
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    changes = article_changes(article).join(' and ')
    article.update(article_params)
    flash.notice = "Article #{changes} has been updated."
    redirect_to article_path(article)
  end
end
