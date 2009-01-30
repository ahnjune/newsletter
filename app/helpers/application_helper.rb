# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def amazon_asin_url(asin)
    "http://www.amazon.com/exec/obidos/ASIN/#{asin}/Associate_ID/#{AMAZON_ASSOCIATE_ID}"
  end
  
  # outputs an h3 with the date if the date changes
  def list_date(date)
    if date
      date = date.beginning_of_day
      if @list_date != date
        return content_tag(:h2, date.strftime("%m/%d/%Y"))
      end
    end
    nil
  ensure
    @list_date = date
  end
  
  def custom_form_for(*args)
    with_options :builder => CustomFormBuilder do |options|
      options.form_for(*args) do |f|
        yield f
      end
    end
  end

  def nav_class(nav_name)
    @nav == nav_name ? "active" : nil
  end
  
  def datetime(time)
    if time
      time.strftime "%m/%d/%Y %I:%M:%p"
    end
  end
  
end
