class EncryptedFieldInput < SimpleForm::Inputs::CollectionSelectInput
  # Use chosen to render a lookup widget
  #------------------------------------------------------------------------------
  def input
    add_placeholder!
    @builder.text_field(attribute_name, input_html_options)
  end

  private
  
  def add_placeholder!
    input_html_options['data-placeholder'] = input_html_options[:placeholder] unless input_html_options[:placeholder].blank?
  end

  def cf
    @cf ||= EncryptedField.find_by(name: attribute_name)
  end
end