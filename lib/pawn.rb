require_relative "game_piece"

class Pawn < GamePiece

  def initialize(color, position)
    super
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
    up_moves
    down_moves
    diagonal_up
    diagonal_down
    diagonal_left_up
    diagonal_left_down
  end
  
  private

  def right_moves
    if location_valid?([@position[0] + 1, @position[1]])
      @possible_moves << [@position[0] + 1, @position[1]]
    end
  end

  def left_moves
    if location_valid?([@position[0] - 1, @position[1]])
      @possible_moves << [@position[0] - 1, @position[1]]
    end
  end

  def up_moves
    if location_valid?([@position[0], @position[1] + 1])
      @possible_moves << [@position[0], @position[1] + 1]
    end
  end

  def down_moves
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
