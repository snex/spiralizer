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
    ERROR_TWO_DIMENSIONAL = 'Only two dimensional arrays are allowed'
    ERROR_INVALID_MATRIX  = 'Input is not a valid matrix'
    ERROR_NOT_CAPITALS    = 'Input elements must be single capital letters'

    def initialize(input)
      @input = input
    end

    def validate!
      raise(ArgumentError, ERROR_TWO_DIMENSIONAL) unless
        @input.is_a?(Array)
      raise(ArgumentError, ERROR_TWO_DIMENSIONAL) unless
        array_two_dimensional?
      raise(ArgumentError, ERROR_INVALID_MATRIX) unless
        valid_matrix?
      raise(ArgumentError, ERROR_NOT_CAPITALS) unless
        elements_capital_letters?
    end

    private

    def array_two_dimensional?
      @input.all? { |val| val.is_a?(Array) }
    end

    def elements_capital_letters?
      @input.all? do |sub_array|
        sub_array.all? do |element|
          element =~ /^[A-Z]$/
        end
      end
    end

    def valid_matrix?
      @input.map(&:size).uniq.size == 1
    end
  end
end
