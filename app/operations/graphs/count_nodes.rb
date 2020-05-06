# frozen_string_literal: true

module Graphs

  # Count the number of nodes in a graph
  class CountNodes
    send(:include, Dry::Monads[:result, :do])

    # @param [Graph::Graph] graph (required)
    # @return [Integer] count
    def call(params)
      values  = yield validate(params)
      count   = yield count(values)

      Success(count)
    end

    private

    def validate(params)
      if params.fetch[:graph] && params.fetch[:graph].is_a?(Graph::Graph)
        Success(params)
      else
        Failure("invalid graph #{params.fetch[:graph]}")
      end
    end

    def create(values)
      count = values[:graph].nodes.size
      count.success? ? Success(count) : Failure(count)
    end

  end
end

