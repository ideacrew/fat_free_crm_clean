# frozen_string_literal: true
require 'dry/monads'
require 'dry/monads/do'

module FatFreeCrm
  module Leads
    class UploadLeads
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
        leads = data_set.collect do |data|
          ::FatFreeCrm::LeadEntityContract.new.call(data)
        end

        if leads.none?(&:failure?)
          Success(leads.map(&:values))
        else
          Failure(leads.collect{|lead| lead.errors if lead&.failure? }.compact)
        end
      end

      def create_entities(values)
        leads = values.collect do |value|
            ::FatFreeCrm::Leads::CreateLeadEntity.new.call(value.to_h)
        end

        Success(leads.map(&:value!))
      end

      def create(entities)
        leads = entities.collect do |entity|
          lead = Lead.new(entity.to_h.compact!)
          lead.save!
        end

        Success(leads)
      end
    end
  end
end
