class GameBoard
  attr_accessor :game_board, :game_array
  def initialize
    @game_array = [[" "," "," "],
                  [" "," "," "],
                  [" "," "," "]]

    @game_board = " #{game_array[0][0]} | #{game_array[0][1]} | #{game_array[0][2]} " + "\n" +
                  "———————————" + "\n" +
                  " #{game_array[1][0]} | #{game_array[1][1]} | #{game_array[1][2]} " + "\n" +
                  "———————————" + "\n" +
                  " #{game_array[2][0]} | #{game_array[2][1]} | #{game_array[2][2]} "
  end
end
game = GameBoard.new
puts game.game_board