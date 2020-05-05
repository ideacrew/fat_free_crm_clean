# frozen_string_literal: true

module BlueTrace
  class EncounterHistory < Dry::Struct

    attribute :id,          Type::Strict::String.meta(omittable: false)
    attribute :contact_id,  Type::Strict::String.meta(omittable: false)
    attribute :time_start,  Type::DateTime.meta(omittable: false)
    attribute :time_end,    Type::DateTime.meta(omittable: false)

    attribute :central_messages,    Type::Array.of(BlueTrace::CentralEncounterMessages)
    attribute :peripheral_messages, Type::Array.of(BlueTrace::PeripheralEncounterMessages)

  end
end