require 'rspec'
require_relative 'num_finder'

describe NumFinder do

  describe '.find' do

    context 'when random array is set manually as [1, 5, 2, 4]' do
      it 'returns 3' do
        finder = NumFinder.new
        expect(finder.find).to eq 3
      end
    end
  end
end