class GameBoard
  attr_accessor :game_board, :game_array

  def initialize
    @game_array = (1..9).to_a
  end

  def draw_board
    @game_board = "#{@game_array[0]} | #{game_array[1]} | #{game_array[2]}" + "\n" +
                  "——┼———┼——" + "\n" +
                  "#{game_array[3]} | #{game_array[4]} | #{game_array[5]}" + "\n" +
                  "——┼———┼——" + "\n" +
                  "#{game_array[6]} | #{game_array[7]} | #{game_array[8]}"
  end
end