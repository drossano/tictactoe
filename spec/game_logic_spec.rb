require_relative '../lib/game_logic'

describe GameLogic do
  describe '#check_for_win_or_draw' do
    subject (:win_check) { described_class.new }
    context 'when a row wins' do
      it 'returns true' do
        symbol = 'x'
        allow(win_check).to receive(:row_win).and_return(true)
        expect(win_check.check_for_win_or_draw(symbol)).to eq(true)
      end
    end
    context 'when a column wins' do
      it 'returns true' do
        symbol = 'x'
        allow(win_check).to receive(:column_win).and_return(true)
        expect(win_check.check_for_win_or_draw(symbol)).to eq(true)
      end
    end
    context 'when a diagonal wins' do
      it 'returns true' do
        symbol = 'x'
        allow(win_check).to receive(:diagonal_win).and_return(true)
        expect(win_check.check_for_win_or_draw(symbol)).to eq(true)
      end
    end
    context 'when theres a draw' do
      it 'returns true' do
        symbol = 'x'
        allow(win_check).to receive(:draw).and_return(true)
        expect(win_check.check_for_win_or_draw(symbol)).to eq(true)
      end
    end
    context 'when there isnt a game over condition' do
      it 'returns false' do
        symbol = 'x'
        expect(win_check.check_for_win_or_draw(symbol)).to eq(false)
      end
    end
  end
end
