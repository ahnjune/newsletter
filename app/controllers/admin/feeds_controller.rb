class Admin::FeedsController < Admin::BaseController

  before_filter :load_feed
  before_filter :set_nav
  
  def index
    @feeds = Feed.ordered
  end

  def fetch_all
    Feed.ordered.each do |feed|
      feed.fetch
    end
    flash[:notice] = "All feeds updated"
    redirect_to :action => "index"
  end
  
  def fetch
    @feed.fetch
    flash[:notice] = "Feed Updated"
    redirect_to :action => "show"
  end
  
  def new
  end
  
  def create
    @feed = Feed.new(params[:feed])
    if @feed.save
      flash[:notice] = "Feed created"
      redirect_to admin_feed_path(@feed) and return
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

  def set_nav
    @nav = :feeds
  end
  
end
