require_relative "game_piece"
require_relative 'string'

class Queen < GamePiece

  def initialize(color, position)
    super
    color == "white" ? @icon = "♛ ".red : @icon = "♛ ".blue
    @possible_moves = [] 
    calc_possible_moves
  end

  def position=(loc)
    if location_valid?(loc)
      @possible_moves = []
      @position = loc
      calc_possible_moves
    end
  end

  def calc_possible_moves
    right_moves
    left_moves
    up_moves
    down_moves
    diagonal_up
    diagonal_down
    diagonal_left_up
    diagonal_left_down
  end
  
  def clear_path?(board, end_x, end_y)
    if clear_up_path?(board, end_x, end_y)
      return true
    else 
      return false
    end
  end

  private

  def clear_up_path?(board, end_x, end_y)
    y = @position[1] + 1
    until y == end_y
      board.grid[end_x][y] == " " ? y += 1 : (return false)
    end
    return true
  end

  def clear_down_path?(board, end_x, end_y)
    y = @position[1] - 1
    until y == end_y
      if board.grid[end_x][y] == " "
        return false
      end
      y -= 1
    end
  end

  def clear_left_path?(board, end_x, end_y)
    y = @position[1] + 1
    until y == end_y
      if board.grid[end_x][y] == " "
        return false
      end
      y += 1
    end
  end

  def clear_right_path?(board, end_x, end_y)
    y = @position[1] + 1
    until y == end_y
      if board.grid[end_x][y] == " "
        return false
      end
      y += 1
    end
  end

  def right_moves
    x = 1
    while location_valid?([@position[0] + x, @position[1]])
      @possible_moves << [@position[0] + x, @position[1]]
      x += 1
    end
  end

  def left_moves
    x = 1
    while location_valid?([@position[0] - x, @position[1]])
      @possible_moves << [@position[0] - x, @position[1]]
      x += 1
    end
  end

  def up_moves
    x = 1
    while location_valid?([@position[0], @position[1] + x])
      @possible_moves << [@position[0], @position[1] + x]
      x += 1
    end
  end

  def down_moves
    x = 1
    while location_valid?([@position[0], @position[1] - x])
      @possible_moves << [@position[0], @position[1] - x]
      x += 1
    end
  end

  def diagonal_up
    x = 1
    while location_valid?([@position[0] + x, @position[1] + x])
      @possible_moves << [@position[0] + x, @position[1] + x]
      x += 1
    end
  end

  def diagonal_down
    x = 1
    while location_valid?([@position[0] + x, @position[1] - x])
      @possible_moves << [@position[0] + x, @position[1] - x]
      x += 1
    end
  end

  def diagonal_left_up
    x = 1
    while location_valid?([@position[0] - x, @position[1] + x])
      @possible_moves << [@position[0] - x, @position[1] + x]
      x += 1
    end
  end

  def diagonal_left_down
    x = 1
    while location_valid?([@position[0] - x, @position[1] - x])
      @possible_moves << [@position[0] - x, @position[1] - x]
      x += 1
    end
  end

end
