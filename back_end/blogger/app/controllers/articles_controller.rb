class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :current_article, only: [:show, :destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Article '#{@article.title}' has been updated."
    else
      render :edit
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "Article '#{@article.title}' successfuly created."
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Article '#{@article.title}' has been removed."
  end


  def current_article
    @article = Article.find(params[:id])
  end

 


end
