require 'rubygems'
require 'amazon/aws/search'

include Amazon::AWS
include Amazon::AWS::Search

item_search = ItemSearch.new("Books", { 
  "Power" => %Q{subject: ruby or rails}
})
response_group = ResponseGroup.new( 'Large' )

request = Request.new
request.locale = 'us'

resp = request.search(item_search, response_group)

items = resp.item_search_response[0].items[0].item

# Available properties for first item:
puts items[0].properties
puts ""

items.each do |item|
  attribs = item.item_attributes[0]
  puts item.asin
  puts attribs.label
  if attribs.list_price
    puts attribs.title, attribs.list_price[0].formatted_price, ''
  end
end
