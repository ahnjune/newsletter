class Admin::FeedsController < ApplicationController
  
  def index
    @feeds = Feed.ordered
  end
  
end
