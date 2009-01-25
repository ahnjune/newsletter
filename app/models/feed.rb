class Feed < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :url
  
  validates_uniqueness_of :title
  validates_uniqueness_of :url
  
  named_scope :ordered, :order => "title"
  
  before_validation :fetch
  
  def to_param
    [id, title.downcase.gsub(/\W/,"")].join("-")
  end

  def fetch
    returning FeedTools::Feed.open(url) do |fetched|
      self.title = fetched.title
    end
  end
  
end
