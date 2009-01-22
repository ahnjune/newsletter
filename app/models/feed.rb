class Feed < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :url
  
end
