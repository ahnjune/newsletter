class RecommendationsController < ApplicationController
  
  before_filter :login_required
  before_filter :set_nav
  
  def show
    @feed_items = current_user.generate_recommendations.paginate(:page => params[:page], :per_page => 15)
  end
  
  private
  
  def set_nav
    @nav = :recommendations
  end
  
end
  