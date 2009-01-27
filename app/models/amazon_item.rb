class AmazonItem < ActiveRecord::Base
  
  has_many :recommendations, :as => :recommendable, :dependent => :destroy
  
end
