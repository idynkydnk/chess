require_relative "game_piece"
require_relative 'string'

class Knight < GamePiece
  attr_accessor :moves

  def initialize(color, position)
    super
    color == "white" ? @icon = "♞ ".red : @icon = "♞ ".blue
    @moves = [[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,1], [-2,-1]]
    @possible_moves = possible_moves
  end
  
  def possible_moves
    possible_moves = []
    @moves.each do |possible_move|
      new_position = [@position[0] + possible_move[0], 
                      @position[1] + possible_move[1]] 
      if location_valid?(new_position)
        possible_moves << new_position
      end
    end
    return possible_moves
  end
end
