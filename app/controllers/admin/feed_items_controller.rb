class Admin::FeedItemsController < Admin::BaseController

  before_filter :load_feed_item
  before_filter :set_nav
  
  private
  
  def load_feed_item
    @feed_item = FeedItem.find(params[:id])
    @feed = @feed_item.feed
  end
  
  def set_nav
    @nav = :feeds
  end

end