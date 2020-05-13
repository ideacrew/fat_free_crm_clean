# frozen_string_literal: true

module Identifiers
  class IdentifierList < Dry::Struct

    attribute :identifiers,         Types::Strict::String.meta(omittable: true)
    attribute :active_on,           Types::DateTime

  end
end



