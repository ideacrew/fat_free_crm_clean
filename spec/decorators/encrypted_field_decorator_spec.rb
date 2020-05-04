require 'rails_helper'

RSpec.describe EncryptedFieldDecorator::Engine, type: :model do
  let(:test_class) do
    class TestClass
      include EncryptedFieldAccessors
      def write_attribute(*args); end
    end

    TestClass.new
  end

  let(:field) do
    double "EncryptedField",
      as: "encrypted_field",
      label: "Label",
      name: "cf_meta",
      required: true,
      disabled: false,
      settings: { "mask" => "*****xxxx"}
  end

  before do
    allow(FatFreeCrm::Field).to receive(:joins).and_return(double(where: [field]))
    allow(test_class).to receive(:write_attribute).with(any_args)
  end

  it "stores data encrypted" do
    allow(SymmetricEncryption).to receive(:encrypt)
    test_class.cf_meta = "hey ho"
    expect(SymmetricEncryption).to have_received(:encrypt)
  end
end