# frozen_string_literal: true

class Spiralizer
  # The Mover object navigates around a matrix in
  # "spiral" order, enabling access to the current
  # element at its cursor
  class Mover
    MOVE_ORDER = %i[right! down! left! up!].cycle

    def initialize(input)
      @input = input
      @max_x = @input.size - 1
      @max_y = @input.first.size - 1
      @cursor = [0, 0]
      @cur_direction = MOVE_ORDER.rewind.next
      @locs_traversed = []
    end

    def cursor_element
      @input[@cursor.first][@cursor.last]
    end

    def move!
      @locs_traversed << [cur_x, cur_y]
      send @cur_direction
    end

    private

    def loc_new?(x, y)
      !@locs_traversed.include?([x, y])
    end

    def can_move?
      send "can_move_#{@cur_direction.to_s.delete('!')}?"
    end

    def can_move_down?
      cur_x < @max_x && loc_new?(cur_x + 1, cur_y)
    end

    def can_move_left?
      cur_y.positive? && loc_new?(cur_x, cur_y - 1)
    end

    def can_move_right?
      cur_y < @max_y && loc_new?(cur_x, cur_y + 1)
    end

    def can_move_up?
      cur_x.positive? && loc_new?(cur_x - 1, cur_y)
    end

    def cur_x
      @cursor.first
    end

    def cur_y
      @cursor.last
    end

    def down!
      can_move? ? @cursor[0] += 1 : switch_directions!
    end

    def left!
      can_move? ? @cursor[1] -= 1 : switch_directions!
    end

    def right!
      can_move? ? @cursor[1] += 1 : switch_directions!
    end

    def up!
      can_move? ? @cursor[0] -= 1 : switch_directions!
    end

    def switch_directions!
      @cur_direction = MOVE_ORDER.next
      raise CannotMoveException unless can_move?
      move!
    end
  end
end
