# frozen_string_literal: true

module Graphs

  # Initialize a new Node instance
  class CreateNode
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])


    # @param [String] key (required)
    # @param [Array<>] neighbors
    # @param [Array<>] weights
    # @return [Graphs::Node] node
    def call(params)
      values  = yield validate(params)
      node    = yield create(values)

      Success(node)
    end

    private

    def validate(params)
      values = Graphs::CreateNodeContract.new.call(params)
      values.success? ? Success(values) : Failure(values)
    end

    def create(values)
      Try { Node.new(values.to_h) }.to_result
    end

  end
end
