require_relative "game_piece"

class Knight < GamePiece

  def initialize(position = [0,0])
    @position = position
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
