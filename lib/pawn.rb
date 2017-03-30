require_relative "game_piece"
require_relative 'string'

class Pawn < GamePiece
  attr_accessor :icon

  def initialize(color, position)
    super
    color == "white" ? @icon = "♙ ".white.bg_black : @icon = "♟ ".black.bg_white
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
    if color == "black"
      down_moves
      diagonal_left_down
      diagonal_down
    elsif color == "white"
      up_moves
      diagonal_left_up
      diagonal_up
    end
  end
  
  private

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
