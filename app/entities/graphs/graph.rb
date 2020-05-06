# frozen_string_literal: true

module Graphs
  class Graph < Dry::Struct

    attribute :nodes, Types::Array.of(Graphs::Node).meta(omittable: false)

  end
end
