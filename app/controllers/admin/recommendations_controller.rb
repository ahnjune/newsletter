class Admin::RecommendationsController < Admin::BaseController
  include ActionView::Helpers::TextHelper

  before_filter :set_nav
  before_filter :load_user
  
  def index
    @recommendations = @user.recommendations.ordered.paginate(:page => params[:page], :per_page => 15)
  end
  
  def create
    new_recommendations = @user.generate_recommendations
    flash[:notice] = "There were #{pluralize new_recommendations.length, 'recommendation'} generated"
    redirect_to :action => "index"
  end
  
  private
  
  def load_user
    @user = User.find(params[:user_id])
  end
  
  def set_nav
    @nav = :users
  end
  
end