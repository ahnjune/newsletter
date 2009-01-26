require 'amazon/aws/search'

class AmazonSearch

  attr_reader :items
  
  include Amazon::AWS
  include Amazon::AWS::Search
  
  def initialize(query)
    is = ItemSearch.new( 'Books', { 'Title' => query } )
    rg = ResponseGroup.new( 'Large' )

    req = Request.new
    req.locale = 'us'

    resp = req.search( is, rg )

    @items = resp.item_search_response[0].items[0].item
  end
  
end