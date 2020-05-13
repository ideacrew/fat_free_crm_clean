# frozen_string_literal: true
require 'dry/monads'
require 'dry/monads/do'

module Crm
  module Leads
    class CreateLeadEntity
      send(:include, Dry::Monads[:result, :do])

      def call(params)
        lead    = yield create(params)

        Success(lead)
      end

      private

      def create(params)
        lead = ::Crm::LeadEntity.new(params)
        Success(lead)
      end
    end
  end
end
