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