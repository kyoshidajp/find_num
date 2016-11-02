class NumFinder

  MIN_NUMBER = 1
  MAX_NUMBER = 1000

  def initialize
    @numbers = Array(MIN_NUMBER..MAX_NUMBER).shuffle
  end

  def pick_up
    @picked_up_number ||= @numbers.delete_at(rand(@numbers.length))
  end

  def find
    @found_number ||= find_by_subtraction
  end

  def output
    print <<-EOS
      numbers: #{@numbers}
      picked_up_number: #{@picked_up_number}
      found_number: #{@found_number}
    EOS
  end

  private

  def find_by_subtraction
    total = @numbers.inject(:+)
    Array(MIN_NUMBER..MAX_NUMBER).inject(:+) - total
  end

  def find_by_array_sub
    (Array(MIN_NUMBER..MAX_NUMBER) - @numbers).first
  end

  def find_by_each_compare
    h = @numbers.zip(@numbers).to_h
    Array(MIN_NUMBER..MAX_NUMBER).each do |n|
      return n unless h.key?(n)
    end
  end
end

if __FILE__ == $0
  finder = NumFinder.new
  finder.pick_up
  finder.find
  finder.output
end