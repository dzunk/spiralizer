module Spiralizer
  class Base

    def initialize(spiral:, strict: true)
      @spiral = spiral
      @strict = strict
    end

    def strict?
      !!strict
    end

    def spiralize!
      spiral.valid!
      result = Spiralizer::Result.new(spiral.to_s)
      return result.value unless strict?
      result.value if result.valid!
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
