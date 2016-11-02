require 'rspec'
require_relative 'num_finder'

describe NumFinder do

  describe '.initialize' do

    it 'should array is shuffled' do
      finder1 = NumFinder.new
      finder2 = NumFinder.new
      sorted_array = Array(NumFinder::MIN_NUMBER..NumFinder::MAX_NUMBER)
      expect(finder1.instance_variable_get(:@numbers)).not_to eq sorted_array
      expect(finder2.instance_variable_get(:@numbers)).not_to eq sorted_array
    end
  end

  describe '.find' do

    context 'when random array is set automatically' do
      it 'returns taken number' do
        finder = NumFinder.new
        finder.pick_up
        finder.find
        found_number = finder.instance_variable_get(:@found_number)
        numbers = finder.instance_variable_get(:@numbers)
        expect(numbers.find {|n| n == found_number}).to be_nil
        expect(found_number).to be >= NumFinder::MIN_NUMBER
        expect(found_number).to be <= NumFinder::MAX_NUMBER
      end
    end
  end

  describe '.find_by_subtraction' do
    it 'returns taken number' do
      finder = NumFinder.new
      finder.pick_up
      found_number = finder.send(:find_by_subtraction)
      numbers = finder.instance_variable_get(:@numbers)
      expect(numbers.find {|n| n == found_number}).to be_nil
      expect(found_number).to be >= NumFinder::MIN_NUMBER
      expect(found_number).to be <= NumFinder::MAX_NUMBER
    end
  end

  describe '.find_by_array_sub' do
    it 'returns taken number' do
      finder = NumFinder.new
      finder.pick_up
      found_number = finder.send(:find_by_array_sub)
      numbers = finder.instance_variable_get(:@numbers)
      expect(numbers.find {|n| n == found_number}).to be_nil
      expect(found_number).to be >= NumFinder::MIN_NUMBER
      expect(found_number).to be <= NumFinder::MAX_NUMBER
    end
  end

  describe '.find_by_each_compare' do
    it 'returns taken number' do
      finder = NumFinder.new
      finder.pick_up
      found_number = finder.send(:find_by_each_compare)
      numbers = finder.instance_variable_get(:@numbers)
      expect(numbers.find {|n| n == found_number}).to be_nil
      expect(found_number).to be >= NumFinder::MIN_NUMBER
      expect(found_number).to be <= NumFinder::MAX_NUMBER
    end
  end

  describe '.find_by_c' do
    it 'returns taken number' do
      finder = NumFinder.new
      finder.pick_up
      found_number = finder.send(:find_by_c)
      numbers = finder.instance_variable_get(:@numbers)
      expect(numbers.find {|n| n == found_number}).to be_nil
      expect(found_number).to be >= NumFinder::MIN_NUMBER
      expect(found_number).to be <= NumFinder::MAX_NUMBER
    end
  end
end