# frozen_string_literal: true

module BlueTrace

  # Bluetooth Low Energy (BLE) protocol
  # In BLE parlance, devices can take on Peripheral or Central roles. Peripherals advertise Services,
  #   and Centrals scan for Peripherals’ advertisements to connect to their Services. Services are a collection
  #   of data, such as Characteristics, which are specific data that can be exchanged between devices, through
  #   read and writes performed by a Central. The data exchanged by BlueTrace devices in each “handshake”
  #   is called an Encounter Message
  # Central Encounter Message
  class PeripheralEncounterMessage < Dry::Struct

    # @!attribute [r] id
    # TempID of the Peripheral Message
    # @return [String]
    attribute :id,  Types::Strict::String.meta(omittable: false)

    # @!attribute [r] mp
    # Device model of the Peripheral, to calibrate distance estimates
    # @return [String]
    attribute :mp,  Types::Strict::String.meta(omittable: false)

    # @!attribute [r] o
    # Organization code indicating the country and health authority with which the Peripheral is enrolled
    # @return [String]
    attribute :o,  Types::Strict::String.meta(omittable: false)

    # @!attribute [r] v
    # Version of the BlueTrace protocol that the Peripheral is running
    # @return [String]
    attribute :v,  Types::Strict::String.meta(omittable: false)

  end
end
