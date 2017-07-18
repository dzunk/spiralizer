module Spiralizer
  class Base

    def initialize(data:, strict: true)
      @spiral = Spiralizer::Spiral.new(data)
      @strict = strict
    end

    def strict?
      !!strict
    end

    def spiralize!
      spiral.valid!
      output = spiral.to_s
      validate_output(output) if strict?
      output.downcase
    end

    def spiralize
      spiralize!
    rescue
      return false
    end

    private

    def spiral
      @spiral
    end

    def strict
      @strict
    end

    def validate_output(output_string)
      raise Spiralizer::NumericElementError if output_string.match? /[0-9]/
      raise Spiralizer::LowercaseElementError if output_string.match? /[a-z]/
      raise Spiralizer::InvalidElementError unless output_string.downcase.match? /^[a-z\s]*$/
    end

  end
end
