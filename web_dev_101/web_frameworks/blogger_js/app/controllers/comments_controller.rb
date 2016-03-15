class CommentsController < ApplicationController
  include ApplicationHelper
  include ArticlesHelper

  before_filter :require_login, except: [:create]

  def create
    comment = Comment.new(comment_params)
    comment.article_id = params[:article_id]
    comment.save
    flash.notice = "Your comment has been added."
    redirect_to article_path(comment.article)
  end
end
