class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params.require(:comment).permit(:author_name, :body))
    @comment.article_id = params[:article_id]
    @article = @comment.article
    if @comment.save
      redirect_to article_path(@article), notice: 'Comment has been added successfuly'
    else
      render 'articles/show'
    end
  end

end
