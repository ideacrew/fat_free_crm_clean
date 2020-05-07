# frozen_string_literal: true
require 'dry/monads'
require 'dry/monads/do'

module FatFreeCrm
  module Contacts
    class CreateContactEntity
      send(:include, Dry::Monads[:result, :do])

      def call(params)
        contact    = yield create(params)

        Success(contact)
      end

      private

      def create(params)
        contact = ::FatFreeCrm::ContactEntity.new(params)
        Success(contact)
      end
    end
  end
end
