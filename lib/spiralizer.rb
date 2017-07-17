require 'matrix'

require 'spiralizer/base'
require 'spiralizer/errors'
require 'spiralizer/version'

module Spiralizer
  def self.call target
    new(target).spiralize!
  end

  def self.spiralize target
    new(target).spiralize
  rescue
    false
  end

  def self.spiralize! target
    new(target).spiralize!
  end

  def self.new(target, strict: true)
    Base.new(target: target, strict: strict)
  end
end
