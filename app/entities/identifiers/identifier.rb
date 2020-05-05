# frozen_string_literal: true

module Identifiers

  # @example
  #  { key:  :blue_trace_temp_id,
  #    item: 'Fj5jfbTtDySw8JoVsCmeul0wsoIcJKRPV0HtEFUlNvNg6C3wyGj8R1utPbw' }


  contact_1 = {
    Identifiers: [
      { key: :bt_temp_id, item: 'Fj5jfbTtDySw8JoVsCmeul0wsoIcJKRPV0HtEFUlNvNg6C3wyGj8R1utPbw' },
      { key: :mobile_phone, item: '+12025551212' },
    ],
  }

  {
    key_name:     :bt_temp_id,
    kind:         :uuid,
    description:  'BlueTrace encounter messages patient Temporary ID',
  }

  {
    key_name:     :mobile_phone,
    kind:         :phone_number,
    description:  "Contact's mobile phone number in E.164 format"
  }

  class BlueTraceTempId < Dry::Struct

    # @!attribute [r] key_name
    # Unique key for this identifier type
    # @return [Symbol]
    attribute :key_name,                Types::Strict::Symbol.meta(omittable: false)

    # @!attribute [r] kind
    # The data type for this identifier (e.g. Uuid, Integer, String)
    #   to use for validation
    # @return [CovidMost::Types::IdIdentifier]
    attribute :kind,                    Types::IdentifierKind.meta(omittable: false)

    # @!attribute [r] source_key
    # Reference to the organization that issued the identifier
    # @return [CovidMost::IdentifierKind]
    attribute :source_organization_id,  Types::Strict::Symbol.meta(omittable: true)

    attribute :description,             Type::Strict::String.meta(omittable: true)

  end
end
