require 'benchmark'
require_relative 'num_finder'

BIG_NUMBER = 1_000_000

Benchmark.bm 20 do |r|
  
  finder = NumFinder.new
  finder.instance_eval do
    @numbers = Array(1..BIG_NUMBER).shuffle
  end
  
  r.report 'find_by_subtraction' do
    finder.take
    finder.send(:find_by_subtraction)
  end

  r.report 'find_by_array_sub' do
    finder.take
    finder.send(:find_by_array_sub)
  end
end
