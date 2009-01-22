class Feed < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :url
  
  named_scope :ordered, :order => "name"
  
end
