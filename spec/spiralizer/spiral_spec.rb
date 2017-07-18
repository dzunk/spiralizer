require 'spec_helper'

RSpec.describe Spiralizer::Spiral do

  describe '#initialize' do
    it 'requires a data parameter' do
      expect{ Spiralizer::Spiral.new }.to raise_error ArgumentError
    end
  end

  describe '#valid!' do
    it 'raises errors when invalid' do
      expect{ Spiralizer::Spiral.new('foo').valid! }.
        to raise_error Spiralizer::InvalidSpiralError
    end
  end

  describe '#valid?' do
    context 'without an Array or Matrix as data' do
      it 'is invalid' do
        good_array  = [['A', 'B'], ['C', 'D']]
        good_matrix = Matrix[*good_array]

        expect(Spiralizer::Spiral.new(good_array)).to be_valid
        expect(Spiralizer::Spiral.new(good_matrix)).to be_valid
        expect(Spiralizer::Spiral.new('foo')).not_to be_valid
      end
    end
    context 'when the data is not populated correctly' do
      bad_data = [
        ['I', 'M', 'A', 'L'],
        ['A', 'P', 'O', 'I'],
        ['E', 'T', 'T'],
        ['T', 'E', 'L', 'T'],
      ]
      it 'is invalid' do
        expect(Spiralizer::Spiral.new(bad_data)).not_to be_valid
      end
    end
  end

  describe '#to_s' do
    it 'returns the data as an uppercase spiralized string' do
      abe = [
        ['F', 'O', 'U', 'R', 'S'],
        ['E', 'N', 'Y', 'E', 'C'],
        ['V', 'G', 'O', 'A', 'O'],
        ['E', 'A', 'S', 'R', 'R'],
        ['S', 'D', 'N', 'A', 'E']
      ]
      lincoln = 'F O U R S C O R E A N D S E V E N Y E A R S A G O'
      expect(Spiralizer::Spiral.new(abe).to_s).to eq lincoln
    end
  end

end
