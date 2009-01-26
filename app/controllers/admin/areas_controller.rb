class Admin::AreasController < Admin::BaseController
  
  before_filter :set_nav
  before_filter :load_area
  
  def index
    load_areas
  end

  def update
    if @area.update_attributes(params[:area])
      flash[:notice] = "Area updated"
      redirect_to :action => "index" and return
    end
    render :action => "edit"
  end

  def create
    @area = Area.new(params[:area])
    if @area.save
      flash[:notice] = "New Area created"
      redirect_to :action => "index" and return
    end
    load_areas
    render :action => "index"
  end
  
  private

  def load_area
    @area = Area.find(params[:id]) if params[:id]
  end

  def load_areas
    @areas = Area.ordered
  end
  
  def set_nav
    @nav = :areas
  end
  
end