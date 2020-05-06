# frozen_string_literal: true

require 'dry-types'

module CovidMost
  module Types
    send(:include, Dry.Types())
    include Dry::Logic


    IdentifierKind      = Types::Coercible::Symbol.default(:string).enum(:string, :integer, :uuid, :phone_number)

    OrganizationStatus = Types::Coercible::Symbol.default(:headquarters).enum(:billing, :shipping, :satellite, :headquarters)
    ContactAddress      = Types::Coercible::Symbol.default(:home).enum(:billing, :shipping, :work, :home)

    # E.164 Standard
    PhoneNumber       = Types::String.constrained(format: /^\+(?:[0-9] ?){6,14}[0-9]$/)
    # PhoneNumber       = Types::String.constrained(format: /^\+\d{1,3}\s\d{1,14}(\s\d{1,13})$/)
    # PhoneNumber       = Types::String.constrained(format: /^\+\d{1,3}\s\d{1,14}(\s\d{1,13})?/)

    Email             = Types::String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
    EmailOrString     = Types::Email | Types::String

    Serializers       = Types::String.default('yaml_serializer'.freeze).enum('yaml_serializer', 'xml_serializer')
    Stores            = Types::String.default('file_store'.freeze).enum('file_store')

    CallableDate      = Types::Date.default { Date.today }
    CallableDateTime  = Types::DateTime.default { DateTime.now }

    HashOrNil         = Types::Hash | Types::Nil
    StringOrNil       = Types::String | Types::Nil


    RequiredString    = Types::Strict::String.constrained(min_size: 1)
    StrippedString    = Types::String.constructor(&:strip)
    SymbolOrString    = Types::Symbol | Types::String
    NilOrString       = Types::Nil | Types::String

    StrictSymbolizingHash = Types::Hash.schema({}).strict.with_key_transform(&:to_sym)

    Callable   = Types.Interface(:call)

  end
end