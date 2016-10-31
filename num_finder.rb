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
    return @find_number unless @find_number.nil?
    total = @numbers.inject(:+)
    max = @numbers.length + 1
    @find_number = Array(1..max).inject(:+) - total
  end

  def debug
    print <<-EOS
      numbers: #{@numbers}
      selected_number: #{@selected_number}
      find_number: #{@find_number}
    EOS
  end
end

if __FILE__ == $0
  finder = NumFinder.new
  finder.take
  finder.find
  finder.debug
end