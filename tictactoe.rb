class GameLogic
  def initialize
    @board = GameBoard.new
    @player_x = Player.new("X")
    @player_o = Player.new("O")
  end

  def game_loop
    loop do
      player_turn(@player_x)
      player_turn(@player_o)
    end
  end

  def player_turn(player)
    puts @board.draw_board
    loop do
      column = player.player_input("column")
      row = player.player_input("row")
      if @board.game_array[row][column] == " "
        @board.game_array[row][column] = player.player_symbol
        break
      else
        puts "This space is taken, try again."
      end
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

  def player_input(series)
    input_range = [1, 2, 3]
    input = nil
    until input_range.include?(input)
      puts "Player #{player_symbol}, please enter the #{series} for your move."
      input = gets.chomp.to_i
    end
    input - 1
  end
end

game = GameLogic.new

game.game_loop
