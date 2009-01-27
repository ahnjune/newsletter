class AmazonTitle < ActiveRecord::Base
  
  has_many :recommendations, :as => :recommendable, :dependent => :destroy
  
end
