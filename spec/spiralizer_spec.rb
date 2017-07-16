require 'spec_helper'

RSpec.describe Spiralizer do

  let(:sample_array) { [
    ['A', 'B', 'C', 'D'],
    ['E', 'F', 'G', 'H'],
    ['I', 'J', 'K', 'L']
  ]}
  let(:sample_string) {
    'a b c d h l k j i e f g'
  }

  describe '.call' do
    it 'requires a target' do
      expect{ Spiralizer.call(nil) }.to raise_error ArgumentError
    end
    it 'returns a spiralized string' do
      expect(Spiralizer.call(sample_array)).to eq sample_string
    end
  end

  describe '.spiralize!' do
    it 'is an alias for .call' do
      expect(Spiralizer.spiralize!(sample_array)).to eq Spiralizer.call(sample_array)
    end
    it 'raises errors when appropriate' do
      expect{ Spiralizer.spiralize!([]) }.to raise_error InvalidTargetError
    end
  end

  describe '.spiralize' do
    it 'is an alias for .call' do
      expect(Spiralizer.spiralize(sample_array)).to eq Spiralizer.call(sample_array)
    end
    it 'returns false on error' do
      expect{ Spiralizer.spiralize([]) }.not_to raise_error
      expect(Spiralizer.spiralize([])).to eq false
    end
  end

  describe '.new' do
    it 'requires a target' do
      expect{ Spiralizer.new(nil) }.to raise_error ArgumentError
    end
    it 'accepts optional parameters' do
      foo = Spiralizer.new(sample_array, strict: false)
      expect(foo).not_to be_strict
    end
    it 'returns a Spiralizer::Base instance' do
      expect(Spiralizer.new(sample_array)).to be_a Spiralizer::Base
    end
  end

end
