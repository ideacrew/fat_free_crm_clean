module EncryptedFieldDecorator
  class Engine < ::Rails::Engine
    paths["app/models"] << "app/models/fields/"
    Field.register(:as => 'encrypted_field', :klass => 'EncryptedField', :type => 'string')
  end
end