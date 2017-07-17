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

  describe '#spiralize!' do
    it 'spiralizes properly' do
      s = Spiralizer::Base
      expect(s.new(target: rick).spiralize!).to eq morty
      expect(s.new(target: banjo).spiralize!).to eq kazooie
    end
  end

end
