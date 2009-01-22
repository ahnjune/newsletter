class Admin::FeedsController < ApplicationController

  before_filter :load_feed
  
  def index
    @feeds = Feed.ordered
  end
  
  def create
    @feed = Feed.new(params[:feed])
    if @feed.save
      flash[:notice] = "Feed created"
      redirect_to admin_feeds_path and return
    end
    render :action => "new"
  end

  private
  
  def load_feed
    @feed = Feed.find(params[:id]) if params[:id]
  end
  
end
