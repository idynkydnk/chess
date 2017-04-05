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
  
  private

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
