class FeedItem < ActiveRecord::Base
  
  belongs_to :feed
  validates_presence_of :feed

  named_scope :ordered, :order => "published_at DESC"

end
