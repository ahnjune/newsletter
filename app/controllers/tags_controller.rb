class TagsController < ApplicationController
  
  before_filter :set_nav
  before_filter :login_required
  
  private
  
  def set_nav
    @nav = :tags
  end
  
  
end