require_relative 'player'
require_relative 'board'
require 'yaml'

class Chess
  attr_accessor :player_one, :player_two, :board, :current_player, :game_number

  def initialize
    @board = Board.new
    @player_one = Player.new
    @player_two = Player.new
    @current_player = [@player_one, @player_two].sample
  end

  def play
    clear_screen
    get_players
    pick_colors
    loop do
      @board.print_board
      winner_message if @board.checkmate?(@current_player) 
      colors_message
      turn_message
      check_message if @board.check?(@current_player)
      save_options_message
      get_move
      switch_players
      clear_screen
    end
  end

  def load_saved_game
    clear_screen
    loop do
      @board.print_board
      winner_message if @board.checkmate?(@current_player) 
      colors_message
      turn_message
      check_message if @board.check?(@current_player)
      save_options_message
      get_move
      switch_players
      clear_screen
    end
  end

  def check_move(move)
    regex = /[a-hA-H][1-8],[a-hA-H][1-8]$/
    move =~ regex ? true : false
  end

  private

  def save_options_message
    puts "'q' to quit"
    puts "'s' to save and exit"
  end

  def check_message
    puts "You're in check!"
    puts
  end

  def check_board_move(move)
    @board.check_move(move, @current_player)
  end

  def draw_message
    puts "It's a draw!"
    puts
  end

  def clear_screen
    system("clear")
  end

  def winner_message
    switch_players
    puts "Checkmate!"
    puts "#{@current_player.name} is the winner!"
    puts
    exit
  end

  def turn_message
    @current_player.color == "white" ? color = "red" : color = "blue"
    puts "#{@current_player.name}: It's your turn(#{color})"
    puts
  end

  def get_move
    puts "Enter your move (C3,D5):"
    move = gets.chomp.upcase
    if move == "Q"
      exit
    elsif move == "S"
      save_game 
    elsif check_move(move) && check_board_move(move)
      make_move(move)
    else
      get_move 
    end
  end

  def save_game
    5.times do |x|
      if !File.exist?("games/game#{x}")
        filename = "games/game#{x}"
        File.open(filename, 'w') { |f| f.write(YAML.dump(self)) }
        puts "Game saved as game#{x}"
        sleep 2
        exit
      end
    end
    puts "Too many games, go delete some!"
    exit
  end

  def make_move(move)
    @board.move_piece(move, @current_player)
  end

  def switch_players
    @current_player == @player_one ? @current_player = @player_two : @current_player = @player_one
  end

  def get_players
    # print "Enter first players name: "
    # @player_one.name = gets.chomp
    # print "Enter second players name: "
    # @player_two.name = gets.chomp
    # it's not like anyone will be playing this
    @player_one.name = "Kyle"
    @player_two.name = "Quy"
  end
  
  def pick_colors
    @player_one.color = ["white", "black"].sample
    @player_one.color == "white" ? @player_two.color = "black" : @player_two.color = "white"
  end

  def colors_message
    puts
    if @player_one.color == "white"
      puts "#{@player_one.name}'s color is red"
      puts "#{@player_two.name}'s color is blue"
    else
      puts "#{@player_one.name}'s color is blue"
      puts "#{@player_two.name}'s color is red"
    end
    puts
  end

end

