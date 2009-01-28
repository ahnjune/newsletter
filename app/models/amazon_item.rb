class AmazonItem < ActiveRecord::Base
  
  has_many :recommendations, :as => :recommendable, :dependent => :destroy
  validates_presence_of :asin
  
  
  # Class Methods --------------------------------------------------------------
  
  class << self
    
    def search_books_by_keywords(*keywords)
      search("Books", "Power" => "keywords: #{keywords.flatten.join(' or ')}")
    end
    
    # creates a number of amazon items based on a query. it will persist those items
    # that are found if necessary and return them..
    def search(area, query, pages=3)
      logger.info "Performing Amazon search in #{area}: #{query.inspect}"
      result = []
      (1..pages).each do |page|
        begin
          items = AmazonSearch.new(area, query.merge("ItemPage" => page)).items
          result += items.map { |item| store_or_lookup(item) }.compact
        rescue Exception => e
          logger.info "An error occured while searchin on page #{page}: #{e}"
          break
        end
      end
      result
    end

    # takes a raw item from the amazon search and if it is found in the database, it returns
    # that item. Else, it persists the item and then returns it.
    def store_or_lookup(item)
      if asin = amazon_asin(item)
        returning AmazonItem.find_or_create_by_asin(asin) do |amazon_item|
          amazon_item.update_from_amazon(item)
        end
      end
    end
    
    def amazon_asin(item)
      if item and asin = item.asin.to_s
        return asin
      end
    end
  end
  
  # Instance Methods -----------------------------------------------------------
  
  def update_from_amazon(item)
    attributes = item.item_attributes[0]
    update_attribute :title, attributes.title.to_s
  end
  
  
end
