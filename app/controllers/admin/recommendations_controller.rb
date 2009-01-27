class Admin::RecommendationsController < Admin::BaseController
  
  before_filter :load_user
  
  def index

  end
  
  private
  
  def load_user
    @user = User.find(params[:user_id])
  end
  
end