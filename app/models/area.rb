class Area < ActiveRecord::Base
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  named_scope :ordered, :order => "name"
  
  
end
