class NumFinder

  MIN_NUMBER = 1
  MAX_NUMBER = 1000

  def initialize
    @numbers = Array(MIN_NUMBER..MAX_NUMBER).shuffle
  end

  def take
    @selected_number ||= @numbers.delete_at(rand(@numbers.length))
  end

  def find
    @find_number ||= find_by_subtraction
  end

  def debug
    print <<-EOS
      numbers: #{@numbers}
      selected_number: #{@selected_number}
      find_number: #{@find_number}
    EOS
  end

  private

  def find_by_subtraction
    total = @numbers.inject(:+)
    Array(MIN_NUMBER..MAX_NUMBER).inject(:+) - total
  end

  def find_by_array_sub
    Array(MIN_NUMBER..MAX_NUMBER) - @numbers
  end

  def find_by_each_compare
    Array(MIN_NUMBER..MAX_NUMBER).each do |n|
      found = @numbers.find {|m| n == m}.nil?
      return found if found
    end
  end
end

if __FILE__ == $0
  finder = NumFinder.new
  finder.take
  finder.find
  finder.debug
end