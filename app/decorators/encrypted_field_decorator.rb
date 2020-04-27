module EncryptedFieldDecorator
  class Engine < ::Rails::Engine
    paths["app/models"] << "app/models/fields/"
    Field.register(:as => 'encrypted_field', :klass => 'EncryptedField', :type => 'string')
  end
end

class Contact
  def cf_ssn=(value) # :nodoc
    super SymmetricEncryption.encrypt(value)
  end

  def cf_ssn
    SymmetricEncryption.decrypt(super).gsub(/.(?=.{4})/,'*')
  end
end