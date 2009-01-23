# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def custom_form_for(*args)
    with_options :builder => CustomFormBuilder do |options|
      options.form_for(*args) do |f|
        yield f
      end
    end
  end
  
end
