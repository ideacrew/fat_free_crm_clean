# frozen_string_literal: true

module Graphs

  # Schema and validation rules for the {CovidMost::Graphs::CreateNode} operation
  class CreateNodeContract < ApplicationContract

    # @!method call(opts)
    # @param [Hash] opts the parameters to validate using this contract
    # @option opts [Symbol] :key required
    # @option opts [Array<Neighbor>] :neighbors optional
    # @option opts [Array<Weights>] :weights optional
    # @return [Dry::Monads::Result::Success] if params pass validation
    # @return [Dry::Monads::Result::Failure] if params fail validation
    params do
      required(:key).value(:string)
      optional(:neighbors).array(:hash)
      optional(:weights).array(:hash)
    end

  end
end
