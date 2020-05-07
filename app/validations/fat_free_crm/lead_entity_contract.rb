# frozen_string_literal: true

module FatFreeCrm

  # Schema and validation rules for the {CovidMost::FatFreeCrm::UploadLead} operation
  class LeadEntityContract < ApplicationContract

    # @!method call(opts)
    # @return [Dry::Monads::Result::Success] if params pass validation
    # @return [Dry::Monads::Result::Failure] if params fail validation
    params do
      required(:first_name).filled(:string)
      required(:last_name).filled(:string)

      optional(:user_id).maybe(:integer)
      optional(:campaign_id).maybe(:integer)
      optional(:assigned_to).maybe(:integer)
      optional(:access).maybe(:string)
      optional(:title).maybe(:string)
      optional(:company).maybe(:string)
      optional(:source).maybe(:string)
      optional(:status).maybe(:string)
      optional(:referred_by).maybe(:string)
      optional(:email).maybe(:string)
      optional(:alt_email).maybe(:string)
      optional(:phone).maybe(:string)
      optional(:mobile).maybe(:string)
      optional(:blog).maybe(:string)
      optional(:linkedin).maybe(:string)
      optional(:facebook).maybe(:string)
      optional(:twitter).maybe(:string)
      optional(:rating).maybe(:integer)
      optional(:do_not_call).maybe(:bool)
      optional(:deleted_at).maybe(:date)
      optional(:created_at).maybe(:date)
      optional(:updated_at).maybe(:date)
      optional(:background_info).maybe(:string)
      optional(:skype).maybe(:string)
    end
  end
end
