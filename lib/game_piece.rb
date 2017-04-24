class GamePiece
  attr_accessor :position, :possible_moves, :color, :icon

  def initialize(color, position)
    if color == "black" || color == "white"
      @color = color
    else
      raise "game piece must be either black or white"
    end
    if location_valid?(position)
      @position = position
    end
    @possible_moves = []
  end

  def clear_path?(board, end_x, end_y)
    return true
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
