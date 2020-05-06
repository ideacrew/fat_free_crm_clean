# frozen_string_literal: true

module BlueTrace
  class EncounterHistory < Dry::Struct

    attribute :id,          Types::Strict::String.meta(omittable: false)
    attribute :contact_id,  Types::Strict::String.meta(omittable: false)
    attribute :time_start,  Types::DateTime.meta(omittable: false)
    attribute :time_end,    Types::DateTime.meta(omittable: false)

    attribute :central_messages,    Types::Array.of(BlueTrace::CentralEncounterMessage)
    attribute :peripheral_messages, Types::Array.of(BlueTrace::PeripheralEncounterMessage)

  end
end