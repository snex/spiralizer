# frozen_string_literal: true

class Spiralizer
  # The Mover object navigates around a matrix in
  # "spiral" order, enabling access to the current
  # element at its cursor
  class Mover
    MOVE_ORDER = %i[right down left up].cycle

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
      send("move_#{@cur_direction}!")
    end

    private

    def can_move_down?
      cur_x < @max_x &&
        !@locs_traversed.include?([cur_x + 1, cur_y])
    end

    def can_move_left?
      cur_y.positive? &&
        !@locs_traversed.include?([cur_x, cur_y - 1])
    end

    def can_move_right?
      cur_y < @max_y &&
        !@locs_traversed.include?([cur_x, cur_y + 1])
    end

    def can_move_up?
      cur_x.positive? &&
        !@locs_traversed.include?([cur_x - 1, cur_y])
    end

    def cur_x
      @cursor.first
    end

    def cur_y
      @cursor.last
    end

    def move_down!
      if can_move_down?
        @cursor[0] += 1
      else
        switch_directions!
      end
    end

    def move_left!
      if can_move_left?
        @cursor[1] -= 1
      else
        switch_directions!
      end
    end

    def move_right!
      if can_move_right?
        @cursor[1] += 1
      else
        switch_directions!
      end
    end

    def move_up!
      if can_move_up?
        @cursor[0] -= 1
      else
        switch_directions!
      end
    end

    def switch_directions!
      @cur_direction = MOVE_ORDER.next
      raise CannotMoveException unless send("can_move_#{@cur_direction}?")
      send("move_#{@cur_direction}!")
    end
  end
end
