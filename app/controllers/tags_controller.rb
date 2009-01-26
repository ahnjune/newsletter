class TagsController < ApplicationController
  
  before_filter :set_nav
  before_filter :login_required

  def create
    current_user.add_tag(params[:tag][:name])
    redirect_to tags_path
  end
  
  def destroy
    current_user.remove_tag(params[:id])
    redirect_to tags_path
  end
  
  private
  
  def set_nav
    @nav = :tags
  end
  
  
end