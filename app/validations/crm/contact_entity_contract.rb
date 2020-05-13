# frozen_string_literal: true

module Crm

  # Schema and validation rules for the {CovidMost::Crm::UploadContact} operation
  class ContactEntityContract < ApplicationContract

    # @!method call(opts)
    # @return [Dry::Monads::Result::Success] if params pass validation
    # @return [Dry::Monads::Result::Failure] if params fail validation
    params do
      required(:first_name).filled(:string)
      required(:last_name).filled(:string)

      optional(:user_id).maybe(:integer)
      optional(:lead_id).maybe(:integer)
      optional(:assigned_to).maybe(:integer)
      optional(:reports_to).maybe(:integer)
      optional(:access).maybe(:string)
      optional(:title).maybe(:string)
      optional(:department).maybe(:string)
      optional(:source).maybe(:string)
      optional(:email).maybe(:string)
      optional(:alt_email).maybe(:string)
      optional(:phone).maybe(:string)
      optional(:mobile).maybe(:string)
      optional(:blog).maybe(:string)
      optional(:fax).maybe(:string)
      optional(:linkedin).maybe(:string)
      optional(:facebook).maybe(:string)
      optional(:twitter).maybe(:string)
      optional(:born_on).maybe(:date)
      optional(:do_not_call).maybe(:bool)
      optional(:deleted_at).maybe(:date)
      optional(:created_at).maybe(:date)
      optional(:updated_at).maybe(:date)
      optional(:background_info).maybe(:string)
      optional(:skype).maybe(:string)
    end
  end
end
