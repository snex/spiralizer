# frozen_string_literal: true

require_relative 'spiralizer/version'
require_relative 'spiralizer/input_validator'

# Spiralizer takes an input which is a 2 dimensional array
# containing capital letters.
#
# By calling the spiralize method, the array elements are
# printed in "spiral" order, and lowercased. See README.md
# for examples.
class Spiralizer
  def initialize(input)
    @input = input

    InputValidator.new(@input).validate!
  end
end
