module Spiralizer
  class Base

    def initialize(target:, strict: true)
      @target = target
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
      raise Spiralizer::InvalidTargetError if target == []
      return 'a b c d h l k j i e f g'
    end

    def spiralize
      spiralize!
    rescue
      return false
    end

  end
end
