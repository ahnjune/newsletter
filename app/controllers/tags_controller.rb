class TagsController < ApplicationController
  
  before_filter :set_nav
  before_filter :login_required
  before_filter :too_many_tags, :only => [:create]

  def create
    current_user.add_tag(params[:tag][:name])
    
    if should_generate_recommendations?
      current_user.generate_recommendations
      flash[:notice] = "Based on your tags, here are our recommendations."
      redirect_to recommendations_path and return
    end
    
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

  def too_many_tags
    unless current_user.can_add_more_tags?
      flash[:notice] = "You have reached the maximum number of tags."
      redirect_to tags_path
    end
  end
    

  def should_generate_recommendations?
    current_user.recommendations_generated_at.nil? and current_user.can_generate_recommendations?
  end
  
  def set_nav
    @nav = :tags
  end
  
  
end