class AssignedArea < ActiveRecord::Base
  
  belongs_to :owner, :polymorphic => true
  validates_presence_of :owner
  
  belongs_to :area
  validates_presence_of :area
  
end
