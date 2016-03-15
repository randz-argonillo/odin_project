module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

  def article_changes(article)
    changes = article_params.select { |field, val| article.send(field) != val }
    changes.map{ |k,v| k.to_s }
  end

end
