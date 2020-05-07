# frozen_string_literal: true
require 'dry/monads'
require 'dry/monads/do'

module FatFreeCrm
  module Contacts
    class UploadContacts
      send(:include, Dry::Monads[:result, :do])

      def call(params)
        file = params[:file].first
        data_set = get_csv_data(file)
        values  = yield validate(data_set)
        entities = yield create_entities(values)
        create(entities)
      end

      private

      def get_csv_data(file)
        opened_file = Roo::Spreadsheet.open(file.tempfile.path)

        sheet = opened_file.sheet(0)
        columns = sheet.row(1).map{|e| e.downcase.gsub(' ','_').to_sym }

        (2..sheet.last_row).inject([]) do |result, id|
          row =  Hash[[columns, sheet.row(id)].transpose]
          result << row
          result
        end
      end

      def validate(data_set)
        contacts = data_set.collect do |data|
          ::FatFreeCrm::ContactEntityContract.new.call(data)
        end

        if contacts.none?(&:failure?)
          Success(contacts.map(&:values))
        else
          Failure(contacts.collect{|contact| contact.errors if contact&.failure? }.compact)
        end
      end

      def create_entities(values)
        contacts = values.collect do |value|
            ::FatFreeCrm::Contacts::CreateContactEntity.new.call(value.to_h)
        end
        
        Success(contacts.map(&:value!))
      end

      def create(entities)
        contacts = entities.collect do |entity|
          contact = Contact.new(entity.to_h.compact!)
          contact.save!
        end

        Success(contacts)
      end
    end
  end
end
