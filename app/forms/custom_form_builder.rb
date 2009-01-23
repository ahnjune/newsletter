class CustomFormBuilder < ActionView::Helpers::FormBuilder
  
  %w[text_field text_area password_field].each do |method_name|
    define_method method_name do |field_name, *args|
      content = [label(field_name), super].join("<br/>")
      @template.content_tag(:p, content, :class => method_name)
    end
  end
  
  
  
end