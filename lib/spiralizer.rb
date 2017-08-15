# frozen_string_literal: true

require_relative 'spiralizer/version'
require_relative 'spiralizer/input_validator'
require_relative 'spiralizer/mover'

# Spiralizer takes an input which is a 2 dimensional array
# containing capital letters.
#
# By calling the spiralize method, the array coordinates are
# printed in "spiral" order, and lowercased. See README.md
# for examples.
class Spiralizer
  class CannotMoveException < StandardError; end

  def initialize(input)
    InputValidator.new(input).validate!
    @mover = Mover.new(input)
  end

  def spiralize
    output = []

    loop do
      output << @mover.cursor_element
      begin
        @mover.move!
      rescue CannotMoveException
        break
      end
    end

    output.join(' ').downcase
  end
end
