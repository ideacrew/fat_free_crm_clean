# frozen_string_literal: true

module Directories
  class Organization < Dry::Struct

    attribute :account_id,        Types::String.meta(omittable: false)
    attribute :account_name,      Types::String.meta(omittable: false)
    attribute :phone_number,      Types::PhoneNumber.meta(omittable: true)
    attribute :description,       Types::String.meta(omittable: true)
    attribute :addresses,         Types::Array.of(Locations::Address).meta(omittable: false)
    attribute :status,            Types::OrganizationStatus.meta(omittable: false)
    attribute :email,             Types::Email
    attribute :web_site
    attribute :legal_entity

    # Organization code indicating the country and health authority with which the Peripheral is enrolled
    #   (used for BlueTrace ID and other purposes)
    attribute :organization_code, Type::Strict::String.meta(omittable: true)

  end
end
