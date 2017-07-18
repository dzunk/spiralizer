module Spiralizer
  class Result

    def initialize(value)
      @raw_value = value
    end

    def valid!
      raise NumericElementError if raw_value.match? /[0-9]/
      raise LowercaseElementError if raw_value.match? /[a-z]/
      raise InvalidElementError unless raw_value.match? /^[A-Z\s]*$/
      true
    end

    def valid?
      valid!
    rescue
      false
    end

    def value
      raw_value.downcase
    end

    def to_s
      value
    end

    private

    attr_reader :raw_value

  end
end
