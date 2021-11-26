class GameBoard
  attr_accessor :game_board, :game_array
  def initialize
    @game_array = [[" "," "," "],
                  [" "," "," "],
                  [" "," "," "]]

    @game_board = "   A   B   C " + "\n" +
                  "1  #{game_array[0][0]} | #{game_array[0][1]} | #{game_array[0][2]} " + "\n" +
                  "  ———————————" + "\n" +
                  "2  #{game_array[1][0]} | #{game_array[1][1]} | #{game_array[1][2]} " + "\n" +
                  "  ———————————" + "\n" +
                  "3  #{game_array[2][0]} | #{game_array[2][1]} | #{game_array[2][2]} "
  end
end
game = GameBoard.new
print game.game_board
