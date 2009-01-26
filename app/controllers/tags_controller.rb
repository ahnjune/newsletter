class TagsController < ApplicationController
  
  before_filter :set_nav
  before_filter :login_required

  def create
    current_user.add_tag(params[:tag][:name])
    redirect_to tags_path
  rescue Exception => e
    flash.now[:error] = "Invalid tag: #{e}"
    render :action => "index"
  end
  
  def destroy
    tagging = current_user.taggings.find(params[:id])
    tagging.destroy
    redirect_to tags_path
  end
  
  private
  
  def set_nav
    @nav = :tags
  end
  
  
end