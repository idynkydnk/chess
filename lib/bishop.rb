require_relative "game_piece"
require_relative 'string'

class Bishop < GamePiece

  def initialize(color, position)
    super
    color == "white" ? @icon = "♝ ".red : @icon = "♝ ".blue
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
    diagonal_up
    diagonal_down
    diagonal_left_up
    diagonal_left_down
  end

  def clear_path?(grid, end_x, end_y)
    if end_x > @position[0] && end_y > @position[1]
      return clear_up_right_path?(grid, end_x, end_y)
    elsif end_x < @position[0] && end_y > @position[1]
      return clear_up_left_path?(grid, end_x, end_y)
    elsif end_x < @position[0] && end_y < @position[1]
      return clear_down_left_path?(grid, end_x, end_y)
    elsif end_x > @position[0] && end_y < @position[1]
      return clear_down_right_path?(grid, end_x, end_y)
    end
  end
  
  private

  def clear_up_right_path?(grid, end_x, end_y)
    x = @position[0] + 1
    y = @position[1] + 1
    until x == end_x
      if grid[x][y] == " " 
       x += 1 
       y += 1
      else
        return false
      end
    end
    return true
  end

  def clear_up_left_path?(grid, end_x, end_y)
    x = @position[0] - 1
    y = @position[1] + 1
    until x == end_x
      if grid[x][y] == " " 
       x -= 1 
       y += 1
      else
        return false
      end
    end
    return true
  end

  def clear_down_left_path?(grid, end_x, end_y)
    x = @position[0] - 1
    y = @position[1] - 1
    until x == end_x
      if grid[x][y] == " " 
       x -= 1 
       y -= 1
      else
        return false
      end
    end
    return true
  end

  def clear_down_right_path?(grid, end_x, end_y)
    x = @position[0] + 1
    y = @position[1] - 1
    until x == end_x
      if grid[x][y] == " " 
       x += 1 
       y -= 1
      else
        return false
      end
    end
    return true
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
