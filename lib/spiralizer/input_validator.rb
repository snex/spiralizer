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
      raise(ArgumentError, 'Only two dimensional arrays are allowed') unless
        input.is_a?(Array)
    end
  end
end
