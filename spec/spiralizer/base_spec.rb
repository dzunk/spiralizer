require 'spec_helper'

RSpec.describe Spiralizer::Base do

  rick = [
    ['S', 'H', 'O', 'W'],
    ['O', 'U', 'G', 'M'],
    ['Y', 'T', 'O', 'E'],
    ['T', 'A', 'H', 'W'],
  ]
  morty = 's h o w m e w h a t y o u g o t'

  banjo = [
    ['G', 'O', 'G'],
    ['O', 'Y', 'G'],
    ['B', 'E', 'L']
  ]
  kazooie = 'g o g g l e b o y'

  describe '#initialize' do
    it 'requires a data parameter' do
      expect{ Spiralizer::Base.new }.to raise_error ArgumentError
    end
    it 'accepts a strict parameter' do
      expect{ Spiralizer::Base.new(data: 'foo', strict: 'bar') }.not_to raise_error
    end
  end

  describe '#strict?' do
    it 'defaults to true' do
      s = Spiralizer::Base.new(data: 'foo')
      expect(s).to be_strict
    end
    context 'when initialized with strict: false' do
      it 'returns false' do
        s = Spiralizer::Base.new(data: 'foo', strict: false)
        expect(s).not_to be_strict
      end
    end
  end

  describe '#spiralize!' do
    it 'spiralizes properly' do
      s = Spiralizer::Base
      expect(s.new(data: rick).spiralize!).to eq morty
      expect(s.new(data: banjo).spiralize!).to eq kazooie
    end
    context 'when strict' do
      it 'only spiralizes uppercase elements' do
        loosey = [['A', 'B'], [3, '&']]
        expect{
          Spiralizer::Base.new(data: loosey, strict: true).spiralize!
        }.to raise_error Spiralizer::SpiralizerError
      end
    end
    context 'when not strict' do
      it 'spiralizes any characters' do
        loosey = [['A', 'B'], [3, '&']]
        expect{
          Spiralizer::Base.new(data: loosey, strict: false).spiralize!
        }.not_to raise_error
      end
    end
  end

  describe '#spiralize' do
    it 'wraps #spiralize!' do
      s = Spiralizer::Base.new(data: banjo)
      expect(s.spiralize).to eq s.spiralize!
    end
    it 'returns false on error' do
      expect{ Spiralizer::Base.new(data: 'foo').spiralize }.not_to raise_error
      expect(Spiralizer::Base.new(data: 'foo').spiralize).to eq false
    end
  end

end
