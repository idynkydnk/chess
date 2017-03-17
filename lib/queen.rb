require_relative "game_piece"

class Queen < GamePiece

  def initialize(position = [0,0])
    @position = position
    @possible_moves = [] 
    calc_possible_moves
  end

  def calc_possible_moves
    right_moves
    left_moves
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
end
