require 'rails_helper'

describe EncryptedFieldInput, type: :input do
  before do
    concat input_for(:contact, :cf_meta, as: :encrypted_field)
  end

  it 'includes blank' do
    assert_select 'input#contact_cf_meta'
  end
end