require_relative 'lib/chess'

class Game

  def choice_menu
    system("clear")
    puts "1. New Game"
    puts "2. Load Game"
    puts "3. Delete Game"
    choice = gets.chomp
    case choice
    when "1"
      game = Chess.new
      game.play
    when "2"
      puts Dir.entries("games")
      puts "Just enter the game number, or \"c\" to cancel."
      game_number = gets.chomp
      exit if game_number == "c"
      stored_state = YAML.load(File.read("games/game#{game_number}"))
      game = Chess.new
      game.load_saved_game(stored_state, game_number)
    when "3"
      puts Dir.entries("games")
      puts "Just enter the game number, or \"c\" to cancel."
      game_number = gets.chomp
      exit if game_number == "c"
      puts "deleting game #{game_number}..."
      File.delete("games/game#{game_number}")
      sleep 2
      puts "Game #{game_number} deleted!"
      sleep 2
      choice_menu
    end
  end
end

x = Game.new
x.choice_menu
