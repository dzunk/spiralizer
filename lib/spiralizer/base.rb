module Spiralizer
  class Base

    def initialize(target:, strict: true)
      @target = target.dup.to_a
      @strict = strict
    end

    def strict
      @strict
    end

    def strict?
      !!@strict
    end

    def target
      @target
    end

    def spiralize!
      validate_target
      output = target_to_string(target)
      validate_output(output) if strict?
      output.downcase
    end

    def spiralize
      spiralize!
    rescue
      return false
    end

    private

    def validate_target
      raise Spiralizer::InvalidTargetError if target == []
    end

    def target_to_string(spiral)
      string = ''
      while spiral.length > 0 do
        string << spiral.shift.join(' ') << ' '
        spiral = spiral.transpose.reverse # rotate 90 degrees counterclockwise
      end
      string[0..-2] # remove the trailing space character
    end

    def validate_output(output_string)
      raise Spiralizer::NumericElementError if output_string.match? /[0-9]/
      raise Spiralizer::LowercaseElementError if output_string.match? /[a-z]/
    end

  end
end
