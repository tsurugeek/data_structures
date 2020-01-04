require 'benchmark'
require_relative '../src/stack'

# easy test1
s = Stack.new

puts "empty?: #{s.empty?}"
puts "peek: #{s.peek}"
puts "pop: #{s.pop}"

s.push 1
puts "push 1"
puts "empty?: #{s.empty?}"
puts "peek: #{s.peek}"
puts "pop: #{s.pop}"

s.push 1
puts "push 1"
s.push 2
puts "push 2"
puts "empty?: #{s.empty?}"
puts "peek: #{s.peek}"
puts "pop: #{s.pop}"
puts "empty?: #{s.empty?}"
puts "peek: #{s.peek}"
puts "pop: #{s.pop}"
puts "empty?: #{s.empty?}"
puts "peek: #{s.peek}"
puts "pop: #{s.pop}"

Benchmark.bm(30) do |x|
  nums_of_elements = [1, 100, 10000]

  nums_of_elements.each do |num_of_elements|
    s = Stack.new
    num_of_elements.times do |value|
      s.push value
    end
    x.report("push num=%7d:" % [num_of_elements]) do
      s.push num_of_elements
    end
    x.report("pop  num=%7d:" % [num_of_elements]) do
      s.pop
    end
  end
end


=begin
                                     user     system      total        real
push num=      1:                0.000007   0.000004   0.000011 (  0.000004)
pop  num=      1:                0.000003   0.000001   0.000004 (  0.000003)
push num=    100:                0.000005   0.000001   0.000006 (  0.000004)
pop  num=    100:                0.000003   0.000001   0.000004 (  0.000003)
push num=  10000:                0.000003   0.000001   0.000004 (  0.000003)
pop  num=  10000:                0.000003   0.000001   0.000004 (  0.000003)

Both push and pop run time are O(1) time.
=end
