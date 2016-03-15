class TagsController < ApplicationController
  include ApplicationHelper
  include TagsHelper
  
  before_filter :require_login, only: [:destroy, :edit, :update]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    tag = Tag.find(params[:id])
    tag.update(tags_params)
    flash.notice = "Tag has been updated"
    redirect_to tag_path(tag)
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    flash.notice = "Tag #{tag.name} has been removed."
    redirect_to tags_path
  end

private

end
