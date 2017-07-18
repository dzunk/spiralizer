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
      result = Spiralizer::Result.new(spiral.to_s)
      if result.valid!
        result.value
      end
    end

    def spiralize
      spiralize!
    rescue
      return false
    end

    private

    attr_reader :spiral
    attr_reader :strict

  end
end
