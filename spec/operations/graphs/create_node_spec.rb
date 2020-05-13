# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Graphs::CreateNode do
  # include RegistryDataSeed

  context 'When invalid graph hash is passed without required key' do
    let(:invalid_node)  { { neighbors: [], weights: [] } }
    let(:key_error)     { {:key=>["is missing"]} }

    it "should fail validation" do
      result = subject.call(invalid_node)

      expect(result.failure?).to be_truthy
      expect(result.failure.errors.to_h).to eq key_error
    end
  end


  context 'When valid graph hash passed' do
    let(:valid_node)   { { key: "123", neighbors: [], weights: [] } }

    it "should return success with hash output" do
      result = subject.call(valid_node)

      expect(result).to be_a Dry::Monads::Result::Success
      expect(result.value!).to be_a Graphs::Node
    end
  end
end
