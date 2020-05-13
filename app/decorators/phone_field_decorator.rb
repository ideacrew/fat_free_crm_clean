module PhoneFieldDecorator
  extend ActiveSupport::Concern
  included do
    phony_normalize :phone, default_country_code: 'US'
  end
end

class FatFreeCrm::Contact
  include PhoneFieldDecorator
end

class FatFreeCrm::Lead
  include PhoneFieldDecorator
end

class FatFreeCrm::User
  include PhoneFieldDecorator
end

class FatFreeCrm::Account
  include PhoneFieldDecorator
end
