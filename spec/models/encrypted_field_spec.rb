require 'rails_helper'

RSpec.describe EncryptedField, type: :model do
  describe "a new instance" do
    it 'has a mask writter/accessor' do
      subject.mask = '*****xxxx'
      expect(subject.mask).to eql('*****xxxx')
    end
  end
end