class Area < ActiveRecord::Base
  
  named_scope :ordered, :order => "name"
  
end
