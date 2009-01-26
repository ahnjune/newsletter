class Admin::BaseController < ApplicationController
  
  before_filter :set_admin_area
  before_filter :login_required
  
  private 
  
  def set_admin_area
    @admin_area = true
  end
  
end