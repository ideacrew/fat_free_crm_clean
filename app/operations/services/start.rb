# frozen_string_literal: true

module Services

  class Start
    send(:include, Dry::Monads[:result, :do])

    # @param [String] service_name
    # @return [Dry::Monad::Result<ResourceRegistry::Feature>] monad_result
    def call(param)
      service_class = yield validate(param.to_s)
      result  = yield create(service_class)

      Success(result)
    end

    private

    def validate(param)
      is_const_defined?(param).bind {
        is_const_defined?(param.classify + "::Operations::Services::Start")
      }
    end

    def create(service_class)
      service_class.new.call(CovidMostRegistry)
    end

    def is_const_defined?(str)
      Rails.const_defined?(str.classify) ? Success(str.classify.constantize) : Failure("undefined constant #{str.classify}")
    end
  end
end

