require_relative "game_piece"
require_relative 'string'

class Pawn < GamePiece
  attr_accessor :icon

  def initialize(color, position)
    super
    @color == "white" ? @icon = "♟ ".red : @icon = "♟ ".blue
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
    if @color == "black"
      down_moves
      diagonal_left_down
      diagonal_down
    elsif @color == "white"
      up_moves
      diagonal_left_up
      diagonal_up
    end
  end

  def clear_path?(grid, end_x, end_y)
    if @color == "black"
      if (end_x < @position[0] && end_y < @position[1]) ||
          (end_x > @position[0] && end_y < @position[1])
        return clear_diagonal_path?(grid, end_x, end_y)
      elsif end_x == @position[0] && end_y < @position[1]
        return clear_down_path?(grid, end_x, end_y)
      end
    elsif (end_x < @position[0] && end_y > @position[1]) ||
            (end_x > @position[0] && end_y > @position[1])
        return clear_diagonal_path?(grid, end_x, end_y)
      elsif end_x == @position[0] && end_y > @position[1]
        return clear_up_path?(grid, end_x, end_y)
    end
    return true
  end

  private

  def clear_up_path?(grid, end_x, end_y)
    if end_y == @position[1] + 1
      if grid[end_x][end_y] == " "
        return true
      else 
        return false
      end
    elsif grid[end_x][end_y - 1] == " " &&
          grid[end_x][end_y] == " "
      return true
    else 
      return false
    end
  end

  def clear_down_path?(grid, end_x, end_y)
    if end_y == @position[1] - 1
      if grid[end_x][end_y] == " "
        return true
      else 
        return false
      end
    elsif grid[end_x][end_y + 1] == " " &&
          grid[end_x][end_y] == " "
      return true
    else 
      return false
    end
  end
  

  def clear_diagonal_path?(grid, end_x, end_y)
    if grid[end_x][end_y] == " "
      return false
    elsif grid[end_x][end_y].color == @color
      return false
    else
      return true
    end
  end

  def up_moves
    if @position[1] == 1
      @possible_moves << [@position[0], @position[1] + 2]
    end
    if location_valid?([@position[0], @position[1] + 1])
      @possible_moves << [@position[0], @position[1] + 1]
    end
  end

  def down_moves
    if @position[1] == 6
      @possible_moves << [@position[0], @position[1] - 2]
    end
    if location_valid?([@position[0], @position[1] - 1])
      @possible_moves << [@position[0], @position[1] - 1]
    end
  end

  def diagonal_up
    if location_valid?([@position[0] + 1, @position[1] + 1])
      @possible_moves << [@position[0] + 1, @position[1] + 1]
    end
  end

  def diagonal_down
    if location_valid?([@position[0] + 1, @position[1] - 1])
      @possible_moves << [@position[0] + 1, @position[1] - 1]
    end
  end

  def diagonal_left_up
    if location_valid?([@position[0] - 1, @position[1] + 1])
      @possible_moves << [@position[0] - 1, @position[1] + 1]
    end
  end

  def diagonal_left_down
    if location_valid?([@position[0] - 1, @position[1] - 1])
      @possible_moves << [@position[0] - 1, @position[1] - 1]
    end
  end

end
