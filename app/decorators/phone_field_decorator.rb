module PhoneFieldDecorator
end

class Contact
  phony_normalize :phone, default_country_code: 'US'
end
