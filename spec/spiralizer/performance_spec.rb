require 'spec_helper'
require 'benchmark'

RSpec.describe 'Performance' do

  def random_2d_array(height:, width:)
    a = []
    height.times do
      b = []
      width.times do
        b << random_char
      end
      a << b
    end
    a
  end

  def random_char
    (65 + rand(25)).chr
  end

  it 'works on arbitrarily large arrays' do
    Benchmark.bm do |bm|
      bm.report { Spiralizer.call(random_2d_array(height: 100, width: 100)) }
      bm.report { Spiralizer.call(random_2d_array(height: 200, width: 5)) }
      bm.report { Spiralizer.call(random_2d_array(height: 5, width: 200)) }
    end
  end


end
