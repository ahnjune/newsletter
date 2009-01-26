class Admin::UsersController < Admin::BaseController

  before_filter :load_user
  before_filter :set_nav
  
  def index
    @users = User.ordered(:email).paginate(:page => params[:page])
  end
  
  private
  
  def load_user
    @user = User.find(params[:id]) if params[:id]
  end
  
  def set_nav
    @nav = :users
  end
  
end