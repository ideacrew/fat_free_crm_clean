# frozen_string_literal: true

module Directories
  class Organization < Dry::Struct

    attribute :account_id,        Types::String.meta(omittable: false)
    attribute :account_name,      Types::String.meta(omittable: false)
    attribute :phone_number,      CovidMost::Types::PhoneNumber.meta(omittable: true)
    attribute :description,       Types::String.meta(omittable: true)
    attribute :addresses,         Types::Array.of(Locations::Address).meta(omittable: false)
    attribute :status,            CovidMost::Types::OrganizationStatus.meta(omittable: false)
    attribute :email,             CovidMost::Types::Email
    attribute :web_site,          Types::String
    attribute :legal_entity,      Types::String

    # Organization code indicating the country and health authority with which the Peripheral is enrolled
    #   (used for BlueTrace ID and other purposes)
    attribute :organization_code, Types::Strict::String.meta(omittable: true)

  end
end
