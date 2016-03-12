class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params.require(:comment).permit(:author_name, :body))
    @comment.article_id = params[:article_id]
    @comment.save
    redirect_to article_path(@comment.article), notice: 'Comment has been added successfuly'
  end

end
