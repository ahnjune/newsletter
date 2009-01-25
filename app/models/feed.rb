class Feed < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :url
  
  validates_uniqueness_of :title
  validates_uniqueness_of :url
  
  named_scope :ordered, :order => "title"
  
  def to_param
    [id, name.downcase.gsub(/\W/,"")].join("-")
  end
  
end
