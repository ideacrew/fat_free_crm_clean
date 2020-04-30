module EncryptedFieldDecorator
  class Engine < ::Rails::Engine
    paths["app/models"] << "app/models/fields/"
    Field.register(:as => 'encrypted_field', :klass => 'EncryptedField', :type => 'string')
  end
end

module EncryptedFieldAccessors
  extend ActiveSupport::Concern

  included do
    if ActiveRecord::Base.connection.table_exists? 'fields'
      Field.joins(:field_group).where(as: 'encrypted_field' , field_groups: { klass_name: 'Contact' }).each do |field|
        define_method "#{field.name}=" do |value|
          write_attribute field.name, SymmetricEncryption.encrypt(value)
        end

        define_method field.name do
          SymmetricEncryption.decrypt(read_attribute(field.name))&.gsub(/.(?=.{4})/,'*')
        end
      end
    end
  end
end

class Account
  include EncryptedFieldAccessors
end

class Campagin
  include EncryptedFieldAccessors
end

class Contact
  include EncryptedFieldAccessors
end

class Lead
  include EncryptedFieldAccessors
end

class Opportunity
  include EncryptedFieldAccessors
end