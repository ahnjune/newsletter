class AreasController < ApplicationController
  
  before_filter :login_required
  before_filter :set_nav
  
  # udpate the user's interests
  def create
    if current_user.update_attributes(params[:user])
      flash[:notice] = "Areas of interest updated"
      redirect_to areas_path and return
    end
    render :action => "index"
  end
  
  private
  
  def set_nav
    @nav = :areas_of_interest
  end
  
end