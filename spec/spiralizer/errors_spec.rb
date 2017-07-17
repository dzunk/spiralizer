require 'spec_helper'

RSpec.describe 'Errors' do

  describe Spiralizer::SpiralizerError do
    it 'is a parent class for all errors' do
      expect(Spiralizer::InvalidTargetError.new).to be_a Spiralizer::SpiralizerError
      expect(Spiralizer::InvalidElementError.new).to be_a Spiralizer::SpiralizerError
      expect(Spiralizer::NumericElementError.new).to be_a Spiralizer::SpiralizerError
      expect(Spiralizer::LowercaseElementError.new).to be_a Spiralizer::SpiralizerError
    end
  end

  describe Spiralizer::InvalidTargetError do
    it 'is raised when the provided data isn\'t a matrix or two-dimensional array' do
      good_array  = [['A', 'B'], ['C', 'D']]
      good_matrix = Matrix[*good_array]
      bad_data    = 'a string (or any other data type)'

      expect{ Spiralizer.call(good_array)  }.not_to raise_error
      expect{ Spiralizer.call(good_matrix) }.not_to raise_error
      expect{ Spiralizer.call(bad_data)    }.to raise_error Spiralizer::InvalidTargetError
    end
  end

  describe Spiralizer::InvalidElementError do
    it 'is a parent class for more specific element errors' do
      expect(Spiralizer::NumericElementError.new).to be_a Spiralizer::InvalidElementError
      expect(Spiralizer::LowercaseElementError.new).to be_a Spiralizer::LowercaseElementError
    end
    it 'is raised when an element is invalid' do
      good_array = [['A', 'B'], ['C', 'D']]
      bad_array  = [['A', 'B'], ['*', 'D']]

      expect{ Spiralizer.call(good_array) }.not_to raise_error
      expect{ Spiralizer.call(bad_array)  }.to raise_error Spiralizer::InvalidElementError
    end
  end

  describe Spiralizer::NumericElementError do
    it 'is raised when an element is numeric' do
      good_array = [['A', 'B'], ['C', 'D']]
      bad_array  = [['A', 'B'], ['3', 'D']]

      expect{ Spiralizer.call(good_array) }.not_to raise_error
      expect{ Spiralizer.call(bad_array)  }.to raise_error Spiralizer::NumericElementError
    end
  end

  describe Spiralizer::LowercaseElementError do
    it 'is raised when an element is lowercase' do
      good_array = [['A', 'B'], ['C', 'D']]
      bad_array  = [['A', 'B'], ['c', 'D']]

      expect{ Spiralizer.call(good_array) }.not_to raise_error
      expect{ Spiralizer.call(bad_array)  }.to raise_error Spiralizer::LowercaseElementError
    end
  end

end
