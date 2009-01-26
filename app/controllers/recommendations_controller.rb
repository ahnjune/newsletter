class RecommendationsController < ApplicationController
  
  before_filter :login_required
  
  def show
    @feed_items = current_user.generate_recommendations.paginate(:page => params[:page], :per_page => 15)
  end
  
end
  