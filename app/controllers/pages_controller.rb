class PagesController < ApplicationController
  
  before_filter :set_nav
  
  def show
    render :action => params[:id]
  end
  
  private
  
  def set_nav
    @nav = params[:id].to_sym
  end
  
end