# frozen_string_literal: true

module BlueTrace

  # Bluetooth Low Energy (BLE) protocol
  # In BLE parlance, devices can take on Peripheral or Central roles. Peripherals advertise Services,
  #   and Centrals scan for Peripherals’ advertisements to connect to their Services. Services are a collection
  #   of data, such as Characteristics, which are specific data that can be exchanged between devices, through
  #   read and writes performed by a Central. The data exchanged by BlueTrace devices in each “handshake”
  #   is called an Encounter Message
  # Central Encounter Message
  class CentralEncounterMessage < Dry::Struct

    # @!attribute [r] id
    # TempID of the Central Message
    # @return [String]
    attribute :id,  Type::Strict::String.meta(omittable: false)

    # @!attribute [r] mc
    # Device model of the Central, to calibrate distance estimates
    # @return [String]
    attribute :mc,  Type::Strict::String.meta(omittable: false)

    # @!attribute [r] rs
    # Received Signal Strength Indicator (RSSI) as measured by the Central of the Peripheral
    # @return [String]
    attribute :rs,  Type::Strict::String.meta(omittable: false)

    # @!attribute [r] o
    # Organization code indicating the country and health authority with which the Central is enrolled
    # @return [String]
    attribute :o,  Type::Strict::String.meta(omittable: false)

    # @!attribute [r] v
    # Version of the BlueTrace protocol that the Central is running
    # @return [String]
    attribute :v,  Type::Strict::String.meta(omittable: false)

  end
end
