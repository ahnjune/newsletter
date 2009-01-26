class CustomFormBuilder < ActionView::Helpers::FormBuilder
  
  %w[text_field text_area password_field check_box].each do |method_name|
    define_method method_name do |field_name, *args|
      options = args.extract_options!
      label = label(field_name)
      field = super(field_name, *[args, options.merge(:class => method_name)].flatten)
      @template.content_tag(:p, [label, field].join("<br/"))
    end
  end
  
  private
  
  
end