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

    context 'when random array is set manually as [1, 5, 2, 4]' do
      it 'returns 3' do
        finder = NumFinder.new
        finder.instance_eval do
          NumFinder::MAX_NUMBER = 5
          @numbers = [1, 5, 2, 4]
        end
        expect(finder.find).to eq 3
      end
    end

    context 'when random array is set automatically' do
      it 'returns taken number' do
        finder = NumFinder.new
        finder.take
        finder.find
        find_number = finder.instance_variable_get(:@find_number)
        numbers = finder.instance_variable_get(:@numbers)
        expect(numbers.find {|n| n == find_number}).to be_nil
      end
    end
  end

  describe '.find_by_subtraction' do
    it 'returns taken number' do
      finder = NumFinder.new
      finder.take
      finder.send(:find_by_subtraction)
      find_number = finder.instance_variable_get(:@find_number)
      numbers = finder.instance_variable_get(:@numbers)
      expect(numbers.find {|n| n == find_number}).to be_nil
    end
  end

  describe '.find_by_array_sub' do
    it 'returns taken number' do
      finder = NumFinder.new
      finder.take
      finder.send(:find_by_array_sub)
      find_number = finder.instance_variable_get(:@find_number)
      numbers = finder.instance_variable_get(:@numbers)
      expect(numbers.find {|n| n == find_number}).to be_nil
    end
  end

  describe '.find_by_each_compare' do
    it 'returns taken number' do
      finder = NumFinder.new
      finder.take
      finder.send(:find_by_each_compare)
      find_number = finder.instance_variable_get(:@find_number)
      numbers = finder.instance_variable_get(:@numbers)
      expect(numbers.find {|n| n == find_number}).to be_nil
    end
  end
end