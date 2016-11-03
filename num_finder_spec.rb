require 'rspec'
require_relative 'num_finder'

describe NumFinder do

  shared_examples 'found number' do
    it 'is in the range' do
      expect(found_number).to be >= NumFinder::MIN_NUMBER
      expect(found_number).to be <= NumFinder::MAX_NUMBER
    end
    it 'returns picked up number' do
      expect(numbers.find {|n| n == found_number}).to be_nil
    end
  end

  describe '.initialize' do

    it 'should array is shuffled' do
      finder1 = NumFinder.new
      finder2 = NumFinder.new
      numbers1 = finder1.instance_variable_get(:@numbers)
      numbers2 = finder2.instance_variable_get(:@numbers)
      sorted_array = Array(NumFinder::MIN_NUMBER..NumFinder::MAX_NUMBER)

      # check carefully
      not_same_order1 = sorted_array != numbers1
      not_same_order2 = sorted_array != numbers2
      expect(not_same_order1 && not_same_order2).to eq true
    end
  end

  describe '.pick_up' do

    it 'returns random number' do
      finder1 = NumFinder.new
      finder2 = NumFinder.new
      found_number1 = finder1.pick_up
      found_number2 = finder2.pick_up
      expect(found_number1 != found_number2).to eq true
    end
  end

  describe '.find' do

    context 'when random array is set automatically' do
      finder = NumFinder.new
      finder.pick_up
      finder.find
      let(:numbers) { finder.instance_variable_get(:@numbers) }
      let(:found_number) { finder.instance_variable_get(:@found_number) }
      it_behaves_like 'found number'
    end
  end

  describe '.find_by_subtraction' do
    finder = NumFinder.new
    finder.pick_up
    let(:numbers) { finder.instance_variable_get(:@numbers) }
    let(:found_number) { finder.send(:find_by_subtraction) }
    it_behaves_like 'found number'
  end

  describe '.find_by_array_sub' do
    finder = NumFinder.new
    finder.pick_up
    let(:numbers) { finder.instance_variable_get(:@numbers) }
    let(:found_number) { finder.send(:find_by_array_sub) }
    it_behaves_like 'found number'
  end

  describe '.find_by_each_compare' do
    finder = NumFinder.new
    finder.pick_up
    let(:numbers) { finder.instance_variable_get(:@numbers) }
    let(:found_number) { finder.send(:find_by_each_compare) }
    it_behaves_like 'found number'
  end

  describe '.find_by_c' do
    finder = NumFinder.new
    finder.pick_up
    let(:numbers) { finder.instance_variable_get(:@numbers) }
    let(:found_number) { finder.send(:find_by_c) }
    it_behaves_like 'found number'
  end
end