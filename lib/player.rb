class Player
  attr_reader :player_symbol, :column, :row

  def initialize(player_symbol)
    @player_symbol = player_symbol
  end

  def player_input
    input_range = (1..9).to_a
    input = nil
    puts "Player #{player_symbol}, please enter a number from 1-9 to fill in the corresponding space."
    loop do
      input = gets.chomp.to_i
      if input_range.include?(input)
        return input
      else
        puts "Incorrect entry. Please enter a number between 1 and 9."
      end
    end
  end
end