class Admin::AreasController < Admin::BaseController
  
  before_filter :set_nav
  
  def index
    @areas = Area.ordered
  end
  
  private
  
  def set_nav
    @nav = :areas
  end
  
end