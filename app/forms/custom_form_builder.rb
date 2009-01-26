class CustomFormBuilder < ActionView::Helpers::FormBuilder
  
  %w[text_field text_area password_field check_box date_select].each do |method_name|
    define_method method_name do |field_name, *args|
      options = args.extract_options!
      label = label(field_name)
      field = super(field_name, *[args, options.merge(:class => method_name)].flatten)
      @template.content_tag(:p, [label, field].join("<br/"))
    end
  end
  
  def select(field_name, *args)
    label = label(field_name)
    @template.content_tag(:p, [label, super].join("<br/"))
  end
  
  private
  
  
end