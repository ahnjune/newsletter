class RecommendationsController < ApplicationController
  
  before_filter :login_required
  before_filter :tags_required
  before_filter :set_nav
  
  def show
    @recommendations = current_user.recommendations.ordered.optimized.paginate(:page => params[:page], :per_page => 25)
  end
  
  private

  def access_denied
    redirect_to page_path(:home)
  end
  
  def tags_required
    if current_user.needs_more_tags? and current_user.recommendations_generated_at.nil?
      flash[:notice] = "You need at least three tags for Thinkful to generate recommendations"
      redirect_to tags_path
    end
  end
  
  def set_nav
    @nav = :recommendations
  end
  
end
  