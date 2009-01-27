class Admin::AmazonSearchesController < Admin::BaseController

  before_filter :set_nav
  
  def show
    @query = params[:query]
    unless @query.blank?
      @search = AmazonSearch.new("Books", "Title" => @query)
    end
  end
  
  private
  
  def set_nav
    @nav = :amazon_search
  end
  
end
