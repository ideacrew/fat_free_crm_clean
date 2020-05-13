# frozen_string_literal: true


module Graphs

  # Initialize a new Node instance
  class AddEdge
    send(:include, Dry::Monads[:result, :do])

    # @param [String] start_key (required)
    # @param [String] end_key (required)
    # @param [Array<>] weights
    # @param [Boolean] undirected
    # @return [Graphs::Graph] graph
    def call(params)
      values  = yield validate(params)
      node    = yield create(values)

      Success(node)
    end

    private

    def validate(params)
      values = Validations::Graphs::EdgeContract(params)
      values.success? ? Success(values) : Failure(values)
    end

    def create(values)
      from  = nodes.index { |node| node.id == values[:start_id] }
      to    = nodes.index { |node| node.id == values[:end_id] }
      nodes[:from].neighbors[to] = true
      nodes[:from].weights[to] = weight if values[:weight]

      if values[:undirected]
        nodes[:to].neighbors[from]  = true
        nodes[:to].weights[from]    = true
      end

      node = Graphs::Node.new.call(values)
      node.success? ? Success(node) : Failure(node)
    end

  end
end

