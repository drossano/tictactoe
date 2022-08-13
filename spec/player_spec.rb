require_relative '../lib/player'

describe Player do
  describe '#player_input' do
    subject(:player_enter) { described_class.new('x') }
    
    context 'when a number between 1 and 9 is entered' do
      before do
        valid_input = '5'
        allow(player_enter).to receive(:gets).and_return(valid_input)
      end
      it 'breaks the loop and returns that input minus 1' do
        expect(player_enter.player_input).to eq(4)
      end
    end
    
    context 'when an invalid input is entered once' do
     before do
        invalid_input = '50'
        valid_input = '5'
        allow(player_enter).to receive(:gets).and_return(invalid_input, valid_input)
      end
      
      it 'returns an error message once' do
        error_message = "Incorrect entry. Please enter a number between 1 and 9."
        expect(player_enter).to receive(:puts).with(error_message)
        expect(player_enter).not_to receive(:puts).with(error_message)
        player_enter.player_input
      end
    end

    context 'when an invalid input is entered twice' do
      before do
        invalid_input = '50'
        valid_input = '5'
        allow(player_enter).to receive(:gets).and_return(invalid_input, invalid_input, valid_input)
      end
      
      it 'returns an error message once' do
        error_message = "Incorrect entry. Please enter a number between 1 and 9."
        expect(player_enter).to receive(:puts).with(error_message).twice
        expect(player_enter).not_to receive(:puts).with(error_message)
        player_enter.player_input
      end
    end
  end
end
