require 'matrix'

require 'spiralizer/base'
require 'spiralizer/spiral'
require 'spiralizer/result'
require 'spiralizer/errors'
require 'spiralizer/version'

module Spiralizer
  def self.call target
    self.spiralize! target
  end

  def self.spiralize target
    new(data: target).spiralize
  end

  def self.spiralize! target
    new(data: target).spiralize!
  end

  def self.new(data:, strict: true)
    Base.new(data: data, strict: strict)
  end
end
