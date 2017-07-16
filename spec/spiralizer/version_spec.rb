require 'spec_helper'

RSpec.describe Spiralizer::VERSION do

  it 'has a version number' do
    expect(Spiralizer::VERSION).not_to be nil
  end

  it 'is 0.1.0' do
    expect(Spiralizer::VERSION).to eq '0.1.0'
  end

end
