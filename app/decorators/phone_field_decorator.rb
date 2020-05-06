module PhoneFieldDecorator
  extend ActiveSupport::Concern
  included do
    phony_normalize :phone, default_country_code: 'US'
  end
end

class Contact
  include PhoneFieldDecorator
end

class Lead
  include PhoneFieldDecorator
end

class User
  include PhoneFieldDecorator
end

class Account
  include PhoneFieldDecorator
end
