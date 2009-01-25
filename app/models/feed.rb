class Feed < ActiveRecord::Base
  
  has_many :feed_items, :dependent => :destroy
  
  validates_presence_of :url  
  validates_uniqueness_of :url
  
  named_scope :ordered, :order => "title"
  
  before_validation :fetch
  after_update :save_feed_items
  
  def title
    super || url
  end
  
  def to_param
    [id, title.downcase.gsub(/\W/,"")].join("-")
  end

  def fetch
    returning FeedTools::Feed.open(url) do |fetched|
      self.title = fetched.title
      fetched.items.each do |item|
        add_fetched_item(item)
      end
    end
  end
  
  def add_fetched_item(item)
    logger.info "Item: #{item.title}"
    if feed_item = feed_items.detect { |feed_item| feed_item.link == item.link}
      # update the feed item
    else
      # add the feed item
      feed_items.push FeedItem.new({
        :feed => self,
        :title => item.title,
        :link => item.link
      })
    end
  end
  
  def save_feed_items
    feed_items.each { |feed_item| feed_item.save(false) }
  end
  
end
