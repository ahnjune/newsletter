class FeedItem < ActiveRecord::Base
  
  belongs_to :feed
  validates_presence_of :feed

  named_scope :ordered, :order => "published_at DESC"

  named_scope :with_tags, lambda { |*tags| {
      :conditions => [tags.flatten.map do |tag|
        "content LIKE ?"
      end.join(" OR "), *tags.flatten.map { |t| "%#{t}%"}]
    }
  }
  
  named_scope :with_areas, lambda { |*areas|
    areas.flatten!
    return {} if areas.empty?
    {:include => {:feed => [:areas] },
    :conditions => "areas.id IN (#{areas.flatten.map { |a| a.id }.join(',')})"}
  }

end
