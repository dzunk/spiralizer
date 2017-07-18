require 'spec_helper'

RSpec.describe Spiralizer::Result do

  subject(:result) { Spiralizer::Result.new('Q W E R T Y') }

  describe '#initialize' do
    it 'requires an argument' do
      expect{ Spiralizer::Result.new }.to raise_error ArgumentError
    end
  end

  describe '#valid!' do
    context 'when the string contains numbers' do
      it 'raises a NumericElementError' do
        number = 'I V E G O T A N U M B 3 R I N M E'
        expect{ Spiralizer::Result.new(number).valid! }.
          to raise_error Spiralizer::NumericElementError
      end
    end
    context 'when the string contains lowercase letters' do
      it 'raises a LowercaseElementError' do
        lower  = 'A n O t H e R o N e B i T e S t H e D u S t'
        expect{ Spiralizer::Result.new(lower).valid! }.
          to raise_error Spiralizer::LowercaseElementError
      end
    end
    context 'when the string contains other invalid characters' do
      it 'raises an InvalidElementError' do
        other  = 'A S T E R * S K'
        expect{ Spiralizer::Result.new(other).valid! }.
          to raise_error Spiralizer::InvalidElementError
      end
    end
    it 'returns true' do
      expect(result.valid!).to eq true
    end
  end

  describe '#valid?' do
    context 'when only uppercase letters and spaces' do
      it 'returns true' do
        good_result = 'Z X C V B N M'
        expect(Spiralizer::Result.new(good_result)).to be_valid
      end
    end
    context 'when other characters' do
      it 'returns false' do
        bad_result = 'foo'
        expect(Spiralizer::Result.new(bad_result)).not_to be_valid
      end
    end
  end

  describe '#value' do
    it 'returns the string with all letters lowercase' do
      upper = 'A S D F G H J K L'
      lower = 'a s d f g h j k l'
      expect(Spiralizer::Result.new(upper).value).to eq lower
    end
  end

  describe '#to_s' do
    it 'is an alias for #value' do
      expect(result.to_s).to eq result.value
    end
  end

end
