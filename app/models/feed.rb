class Feed < ActiveRecord::Base
  
  has_many :feed_items, :dependent => :destroy
  has_many :assigned_areas, :as => "owner", :dependent => :destroy
  has_many :areas, :through => :assigned_areas
  
  validates_presence_of :url  
  validates_uniqueness_of :url
  
  named_scope :ordered, :order => "title"
  
  before_validation :fetch
  after_update :save_feed_items
  
  def title
    super || url
  end
  
  def to_param
    [id, title.downcase[(0..15)].gsub(/\W/,"")].join("-")
  end

  def fetch
    return if url.blank?
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
      feed_item.update_attribute :content, item.content
      feed_item.update_attribute :published_at, item.published
    else
      # add the feed item
      feed_items.push FeedItem.new({
        :feed => self,
        :title => item.title,
        :link => item.link,
        :published_at => item.published,
        :content => item.content
      })
    end
  end
  
  def save_feed_items
    feed_items.each { |feed_item| feed_item.save(false) }
  end
  
end
