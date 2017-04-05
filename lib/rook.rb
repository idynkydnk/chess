require_relative "game_piece"
require_relative 'string'

class Rook < GamePiece

  def initialize(color, position)
    super
    color == "white" ? @icon = "♜ ".red : @icon = "♜ ".blue
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
  end
  
  private

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

end

