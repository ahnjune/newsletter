class RecommendationsController < ApplicationController
  
  before_filter :login_required
  before_filter :set_nav
  
  def show
    @recommendations = current_user.recommendations.ordered.optimized.paginate(:page => params[:page], :per_page => 25)
  end
  
  private
  
  def set_nav
    @nav = :recommendations
  end
  
end
  