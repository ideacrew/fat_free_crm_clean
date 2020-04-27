class EncryptedField < ApplicationRecord
  def lookup_class_name
    "EncryptedField"
  end

  def lookup_field
    "value"
  end

  def lookup_method
    "value"
  end

  def autocomplete
    false
  end

  def multiselect
    false
  end
end
