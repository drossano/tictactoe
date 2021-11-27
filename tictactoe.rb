class GameLogic
  def initialize
    @board = GameBoard.new
    @player_x = Player.new("X")
    @player_o = Player.new("O")
  end

  def game_loop
    loop do
      puts @board.draw_board
      @player_x.player_move
      @board.game_array[@player_x.row][@player_x.column] = @player_x.player_symbol
      puts @board.draw_board
      @player_o.player_move
      @board.game_array[@player_o.row][@player_o.column] = @player_o.player_symbol
      puts @board.draw_board
    end
  end
end

class GameBoard
  attr_accessor :game_board, :game_array

  def initialize
    @game_array = [[" ", " ", " "],
                   [" ", " ", " "],
                   [" ", " ", " "]]
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
    until input_range(@column)
      puts "Player #{player_symbol}, please enter the column for your move."
      @column = gets.chomp.to_i
    end
    @column -= 1
    until input_range(@row)
      puts "Player #{player_symbol}, please enter the row for your move."
      @row = gets.chomp.to_i
    end
    @row -= 1
  end

  def input_range(input)
    input_range = [1, 2, 3]
    input_range.include?(input)
  end
end

game = GameLogic.new

game.game_loop
