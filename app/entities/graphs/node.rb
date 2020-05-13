# frozen_string_literal: true

module Graphs
  class Node < Dry::Struct

    attribute :key,       Types::String.meta(omittable: false)

    # attribute :neighbors, Types::Array.of(Graphs::Edge).meta(omittable: true)
    attribute :neighbors, Types::Array.of(Types::String).meta(omittable: true)

    attribute :weights,   Types::Array.of(Graphs::Weight).meta(omittable: true)

  end
end
