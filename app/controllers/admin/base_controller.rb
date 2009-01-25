class Admin::BaseController < ApplicationController
  
  before_filter :set_admin_area
  
  def set_admin_area
    @admin_area = true
  end
  
end