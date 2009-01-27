class Recommendation < ActiveRecord::Base
  
  belongs_to :user
  validates_presence_of :user
  
  belongs_to :recommendable, :polymorphic => true
  validates_presence_of :recommendable
  
  named_scope :ordered, :order => "recommendations.created_at DESC"
  named_scope :optimized, {} # :include => :recommendable # TODO: this crashes
  
end
