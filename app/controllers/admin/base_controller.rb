class Admin::BaseController < ApplicationController
  
  before_filter :set_admin_area
  before_filter :login_required
  before_filter :admin_required
  
  private 
  
  def set_admin_area
    @admin_area = true
  end
  
  def admin_required
    unless current_user.admin?
      flash[:error] = "Admin required"
      redirect_to root_path
    end
  end
  
end