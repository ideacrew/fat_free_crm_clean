# Conceptually the same as the `:helper` type only with some additional support
# to test simple form inputs. The test runs in the context of `form` which
# is a form build via `simple_form_for` against `object`.
concern :SimpleFormHelpers do
  include RSpec::Rails::HelperExampleGroup
  include Capybara::RSpecMatchers
  include SimpleForm::ActionViewExtensions::FormHelper

  included do
    around do |example|
      simple_form_for object, url: '#' do |form|
        @form = form
        example.run
      ensure
        @form = nil
      end
    end

    attr_reader :form
  end

  private

  def protect_against_forgery?
    false
  end
end