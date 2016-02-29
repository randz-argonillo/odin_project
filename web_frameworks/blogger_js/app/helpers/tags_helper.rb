module TagsHelper
  def tags_params
    params.require(:tag).permit(:name)
  end
end
