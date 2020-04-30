class EncryptedField < CustomField
  Settings = %w(mask lookup_class_name)

  # Renders the value
  #------------------------------------------------------------------------------
  def render(value)
    value
  end

  # Looks up a set of values given a list of ids
  #------------------------------------------------------------------------------
  def lookup_values(value)
    return [] if value.empty? # stops ransack from returning everything
    klass = lookup_class
    klass.search("#{lookup_field}_in" => value).result.my.map(&lookup_method.to_sym).sort
  end
  
  # Returns class to lookup
  # Note: lookup_class_name can be table or model name e.g. 'contact' or 'contacts'
  #------------------------------------------------------------------------------
  def lookup_class
    self.class
  end
  
  # Convenience methods for settings
  #------------------------------------------------------------------------------
  Settings.each do |name|
    define_method name do
      settings["#{name}"]
    end
    define_method "#{name}=" do |value|
      settings["#{name}"] = value
    end
  end

  # Define boolean settings methods for convenience
  #------------------------------------------------------------------------------
  %w(autocomplete multiselect).each do |name|
    define_method "#{name}?" do
      settings["#{name}"] == '1'
    end
  end
end