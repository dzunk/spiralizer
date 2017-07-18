module Spiralizer
  class Spiral

    def initialize(data)
      @data = data
    end

    def valid!
      raise InvalidSpiralError unless valid_data_type? && valid_dimensions?
      true
    end

    def valid?
      valid!
    rescue
      false
    end

    def to_s
      spiral = data.dup.to_a
      out = ''
      while spiral.length > 0 do
        out << spiral.shift.join(' ') << ' '
        spiral = spiral.transpose.reverse # rotate 90 degrees counterclockwise
      end
      # benchmarked against string.rstrip, this was slightly faster
      out[0..-2] # remove the trailing space
    end

    private

    attr_reader :data

    def valid_data_type?
      data.is_a?(Matrix) || data.is_a?(Array)
    end

    def valid_dimensions?
      return false unless data.to_a.length > 0 # we need something to work with!
      total_length = 0
      data.to_a.each do |row|
        return false unless row.is_a?(Array) && row.length > 0
        # Ensure all elements are the same length
        total_length += row.length
        return false unless (total_length % row.length == 0)
      end
    end

  end
end
