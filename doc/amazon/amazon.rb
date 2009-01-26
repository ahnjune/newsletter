require 'rubygems'
require 'amazon/aws/search'

include Amazon::AWS
include Amazon::AWS::Search

is = ItemSearch.new( 'Books', { 'Title' => 'Rails' } )
rg = ResponseGroup.new( 'Large' )

req = Request.new
req.locale = 'us'

resp = req.search( is, rg )

items = resp.item_search_response[0].items[0].item

# Available properties for first item:
#
puts items[0].properties

items.each do |item|
  attribs = item.item_attributes[0]
  puts attribs.label
  if attribs.list_price
    puts attribs.title, attribs.list_price[0].formatted_price, ''
  end
end
