# frozen_string_literal: true

module Graphs

  # Initialize a new Graph instance
  class CreateGraph
    send(:include, Dry::Monads[:result, :do])

    # @param [Array<Node>] nodes
    # @return [Entities::Graphs::Graph] Graph
    def call(params)
      values  = yield validate(params)
      graph   = yield create(values)

      Success(graph)
    end

    private

    def validate(params)
      values = Validations::Graphs::GraphContract(params)
      values.success? ? Success(values) : Failure(values)
    end

    def create(values)
      graph = Graphs::Graph.new.call(values)
      graph.success? ? Success(graph) : Failure(graph)
    end

  end
end

