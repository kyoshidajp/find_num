require 'rspec'
require_relative 'num_finder'

describe NumFinder do

  describe '.initialize' do

    it 'should array is shuffled' do
      finder1 = NumFinder.new
      finder2 = NumFinder.new
      numbers1 = finder1.instance_variable_get(:@numbers)
      numbers2 = finder2.instance_variable_get(:@numbers)
      sorted_array = Array(NumFinder::MIN_NUMBER..NumFinder::MAX_NUMBER)

      # carefully check
      not_same_order1 = sorted_array != numbers1
      not_same_order2 = sorted_array != numbers2
      expect(not_same_order1 && not_same_order2).to eq true
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