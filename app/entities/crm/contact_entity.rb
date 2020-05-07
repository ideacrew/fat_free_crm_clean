# frozen_string_literal: true

module Crm
  class ContactEntity < Dry::Struct

    attribute  :user_id,                 Types::Integer.optional.meta(omittable: true)
    attribute  :lead_id,                 Types::Integer.optional.meta(omittable: true)
    attribute  :assigned_to,             Types::Integer.optional
    attribute  :reports_to,              Types::Integer.optional
    attribute  :first_name,              Types::Strict::String
    attribute  :last_name,               Types::Strict::String
    attribute  :access,                  Types::String.optional
    attribute  :title,                   Types::String.optional
    attribute  :department,              Types::String.optional
    attribute  :source,                  Types::String.optional
    attribute  :email,                   Types::String.optional
    attribute  :alt_email,               Types::String.optional
    attribute  :phone,                   Types::String.optional
    attribute  :mobile,                  Types::String.optional
    attribute  :blog,                    Types::String.optional
    attribute  :fax,                     Types::String.optional
    attribute  :linkedin,                Types::String.optional
    attribute  :facebook,                Types::String.optional
    attribute  :twitter,                 Types::String.optional
    attribute  :born_on,                 Types::Date.optional
    attribute  :do_not_call,             Types::Bool.optional
    attribute  :deleted_at,              Types::Date.optional
    attribute  :created_at,              Types::Date.optional
    attribute  :updated_at,              Types::Date.optional
    attribute  :background_info,         Types::String.optional
    attribute  :skype,                   Types::String.optional

  end
end
