class Admin::RecommendationsController < Admin::BaseController
  
  before_filter :load_user
  
  def index
    @recommendations = @user.recommendations.ordered.paginate(:page => params[:page], :per_page => 15)
  end
  
  private
  
  def load_user
    @user = User.find(params[:user_id])
  end
  
end