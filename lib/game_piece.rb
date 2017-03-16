class GamePiece
  attr_accessor :position, :possible_moves

  def initialize(position = [0,0])
    @position = position
    @possible_moves = []
  end

  def location_valid?(location)
  	if location[0] >= 0 && location[0] <= 7 &&
    	location[1] >= 0 && location[1] <= 7
      return true
    else
      return false
    end
  end


end
