class FeedItem < ActiveRecord::Base
  
  belongs_to :feed
  validates_presence_of :feed

end
