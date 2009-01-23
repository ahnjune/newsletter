class CustomFormBuilder < ActionView::Helpers::FormBuilder
  
  def text_field(*args)
    super
  end
  
end