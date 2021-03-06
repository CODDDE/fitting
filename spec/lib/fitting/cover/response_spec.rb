require 'spec_helper'
require 'fitting/cover/response'

RSpec.describe Fitting::Cover::Response do
  subject { described_class.new(response) }

  let(:json_schema) { double }
  let(:response) { double(json_schema: json_schema, body: {}) }
  let(:json_schemas) do
    double(
      combinations: combinations,
      json_schemas: [{}, {}, {}]
    )
  end
  let(:combinations) { double }

  before { allow(Fitting::Cover::JSONSchema).to receive(:new).and_return(json_schemas) }

  describe '.new' do
    it 'returns described class object' do
      expect(subject).to be_a(described_class)
    end
  end

  describe '#json_schemas' do
    it 'returns json-schemas' do
      expect(subject.json_schemas).to eq([{}, {}, {}, json_schema])
    end
  end

  describe '#combinations' do
    it 'returns combinations' do
      expect(subject.combinations).to eq(combinations)
    end
  end

  describe '#flags' do
    it 'returns flags' do
      expect(subject.flags).to eq([true, true, true])
    end
  end

  describe '#update' do
    it 'returns described class object' do
      expect(subject.update(double(body: {}))).to be_a(described_class)
    end
  end

  describe '#to_hash' do
    it 'returns to_hash' do
      expect(subject.to_hash).to eq('json_schemas' => json_schemas.json_schemas + [response.json_schema],
                                    'combinations' => combinations,
                                    'flags' => [true, true, true])
    end
  end
end
