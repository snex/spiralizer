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
  class CannotMoveException < StandardError; end

  def initialize(input)
    InputValidator.new(input).validate!

    @input = input
    @max_x = @input.size - 1
    @max_y = @input.first.size - 1
    @cur_x = 0
    @cur_y = 0
    @cur_direction = :right
    @elements_traversed = []
  end

  def spiralize
    @elements_traversed.clear

    loop do
      @elements_traversed << @input[@cur_x][@cur_y]
      begin
        move!
      rescue CannotMoveException
        break
      end
    end

    @elements_traversed.join(' ').downcase
  end

  private

  def can_move_down?
    @cur_x < @max_x &&
      !@elements_traversed.include?(@input[@cur_x + 1][@cur_y])
  end

  def can_move_left?
    @cur_y.positive? &&
      !@elements_traversed.include?(@input[@cur_x][@cur_y - 1])
  end

  def can_move_right?
    @cur_y < @max_y &&
      !@elements_traversed.include?(@input[@cur_x][@cur_y + 1])
  end

  def can_move_up?
    @cur_x.positive? &&
      !@elements_traversed.include?(@input[@cur_x - 1][@cur_y])
  end

  def move!
    case @cur_direction
    when :right
      move_right_or_down!
    when :left
      move_left_or_up!
    when :up
      move_up_or_right!
    when :down
      move_down_or_left!
    end
  end

  def move_down!
    @cur_direction = :down
    @cur_x += 1
  end

  def move_down_or_left!
    if can_move_down?
      move_down!
    else
      raise CannotMoveException unless can_move_left?
      move_left!
    end
  end

  def move_left!
    @cur_direction = :left
    @cur_y -= 1
  end

  def move_left_or_up!
    if can_move_left?
      move_left!
    else
      raise CannotMoveException unless can_move_up?
      move_up!
    end
  end

  def move_right!
    @cur_direction = :right
    @cur_y += 1
  end

  def move_right_or_down!
    if can_move_right?
      move_right!
    else
      raise CannotMoveException unless can_move_down?
      move_down!
    end
  end

  def move_up!
    @cur_direction = :up
    @cur_x -= 1
  end

  def move_up_or_right!
    if can_move_up?
      move_up!
    else
      raise CannotMoveException unless can_move_right?
      move_right!
    end
  end
end
