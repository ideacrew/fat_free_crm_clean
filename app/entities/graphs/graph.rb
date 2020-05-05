# frozen_string_literal: true

module Graphs
  class Graph < Dry::Struct

    attribute :nodes, Type::Array.of(Graphs::Node).meta(omittable: false)

  end
end
