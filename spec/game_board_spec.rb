require_relative '../lib/game_board'

describe GameBoard do
  subject(:board) { described_class.new }
  describe '#draw_board' do
    context 'when the game_array is empty' do

      before do
        allow(board).to receive(:game_array).and_return(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
      end
      it 'draws a board with numbers in each space' do
        expect(board.draw_board).to eq("1 | 2 | 3" + "\n" +
                                       "——┼———┼——" + "\n" +
                                       "4 | 5 | 6" + "\n" +
                                       "——┼———┼——" + "\n" +
                                       "7 | 8 | 9")
      end
    end
  end
end