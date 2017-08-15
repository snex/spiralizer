# frozen_string_literal: true

class Spiralizer
  # InputValidator validates input for Spiralizer.
  # Input must be a 2 dimensional array containing
  # capital letters for all elements. All sub-arrays
  # must be of the same size (i.e. it must be a valid
  # matrix).
  #
  # If the input is invalid, an ArgumentError exception
  # will be raised.
  class InputValidator
    def initialize(input)
      @input = input

      raise(ArgumentError, 'Only two dimensional arrays are allowed') unless
        @input.is_a?(Array)
      raise(ArgumentError, 'Only two dimensional arrays are allowed') unless
        array_two_dimensional?
      raise(ArgumentError, 'Input is not a valid matrix') unless
        valid_matrix?
    end

    private

    def array_two_dimensional?
      @input.all? { |val| val.is_a?(Array) }
    end

    def valid_matrix?
      @input.map(&:size).uniq.size == 1
    end
  end
end
