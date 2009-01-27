class Recommendation < ActiveRecord::Base
  
  belongs_to :user
  validates_presence_of :user
  
  belongs_to :recommendable, :polymorphic => true
  validates_presence_of :recommendable
  
end
