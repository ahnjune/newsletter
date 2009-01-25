class Admin::FeedsController < ApplicationController

  before_filter :load_feed
  
  def index
    @feeds = Feed.ordered
  end
  
  def new
    @feed = Feed.new(:url => "slashdot.org")
  end
  
  def create
    @feed = Feed.new(params[:feed])
    if @feed.save
      flash[:notice] = "Feed created"
      redirect_to admin_feeds_path and return
    end
    render :action => "new"
  end

  def destroy
    @feed.destroy
    flash[:notice] = "Feed deleted"
    redirect_to admin_feeds_path
  end
  
  def update
    if @feed.update_attributes(params[:feed])
      flash[:notice] = "Feed updated"
      redirect_to admin_feed_path(@feed) and return
    end
    render :action => "edit"
  end
  
  private
  
  def load_feed
    @feed = Feed.find(params[:id]) if params[:id]
  end
  
end
