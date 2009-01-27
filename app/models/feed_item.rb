class FeedItem < ActiveRecord::Base
  
  belongs_to :feed
  validates_presence_of :feed

  has_many :recommendations, :as => :recommendable, :dependent => :destroy

  named_scope :ordered, :order => "published_at DESC"
  named_scope :limit, lambda { |limit| { :limit => limit} }

  named_scope :with_tags, lambda { |*tags|
    tags.flatten!
    { :conditions => [tags.map do |tag|
        "content LIKE ? OR title LIKE ?"
      end.join(" OR "), *tags.map { |t| ["%#{t}%","%#{t}%"] }.flatten]
    }
  }
  
  named_scope :with_areas, lambda { |*areas|
    areas.flatten!
    return {} if areas.empty?
    {:include => {:feed => [:areas] },
    :conditions => "areas.id IN (#{areas.flatten.map { |a| a.id }.join(',')})"}
  }

  named_scope :unseen_by, lambda { |user| {
      :joins => "LEFT JOIN recommendations on recommendations.user_id = #{user.id}",
      :conditions => ["recommendations.user_id IS NULL"]
    }
  }

end
