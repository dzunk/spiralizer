module Spiralizer

    class SpiralizerError < ::StandardError
    end

    class InvalidSpiralError < SpiralizerError
    end

    class InvalidElementError < SpiralizerError
    end

    class LowercaseElementError < InvalidElementError
    end

    class NumericElementError < InvalidElementError
    end

end
