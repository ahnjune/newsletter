require 'rubygems'
require 'amazon/aws/search'

include Amazon::AWS
include Amazon::AWS::Search

def search(area, options, response_group = "Large")
  item_search = ItemSearch.new(area, options)
  response_group = ResponseGroup.new(response_group)
  request = Request.new
  request.locale = 'us'
  response = request.search(item_search, response_group)
  response.item_search_response[0].items[0].item
end

(1..1).each do |page|
  puts "Searching page #{page}"

  items = search("Books", "Power" => "subject: ruby asin: not B000QCS2HA not 0590189239", "ItemPage" => page)

  # Available properties for first item:
  #puts items[0].properties
  #puts ""

  items.each do |item|
    attribs = item.item_attributes[0]
    puts item.asin
    puts attribs.title
    puts ""
    # puts attribs.label
    # if attribs.list_price
    #   puts attribs.title, attribs.list_price[0].formatted_price, ''
    # end
  end
  
  puts ""
end


