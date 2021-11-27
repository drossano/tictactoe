class GameBoard
  attr_accessor :game_board, :game_array
  def initialize
    @game_array = [[" "," "," "],
                  [" "," "," "],
                  [" "," "," "]]
  end

  def draw_board
    @game_board = "   1   2   3 " + "\n" +
    "1  #{game_array[0][0]} | #{game_array[0][1]} | #{game_array[0][2]} " + "\n" +
    "  ———————————" + "\n" +
    "2  #{game_array[1][0]} | #{game_array[1][1]} | #{game_array[1][2]} " + "\n" +
    "  ———————————" + "\n" +
    "3  #{game_array[2][0]} | #{game_array[2][1]} | #{game_array[2][2]} "
  end
end

class Player
  attr_reader :player_symbol, :column, :row
  def initialize(player_symbol)
    @player_symbol = player_symbol
  end

  def player_move
    puts "Player #{player_symbol}, please enter the column for your move."
    @column = gets.chomp.to_i
    @column -= 1
    puts "Player #{player_symbol}, please enter the row for your move."
    @row = gets.chomp.to_i
    @row -= 1
  end
end

game = GameBoard.new
player_x = Player.new("X")
puts game.draw_board
player_x.player_move
game.game_array[player1.row][player1.column] = player1.player_symbol
puts game.draw_board