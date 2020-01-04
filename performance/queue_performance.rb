require 'benchmark'
require_relative '../src/queue'

# easy test1
q = Queue.new

puts "empty?: #{q.empty?}"
puts "peek: #{q.peek}"
puts "remove: #{q.remove}"

q.add 1
puts "add 1"
puts "empty?: #{q.empty?}"
puts "peek: #{q.peek}"
puts "remove: #{q.remove}"

q.add 1
puts "add 1"
q.add 2
puts "add 2"
puts "empty?: #{q.empty?}"
puts "peek: #{q.peek}"
puts "remove: #{q.remove}"
puts "empty?: #{q.empty?}"
puts "peek: #{q.peek}"
puts "remove: #{q.remove}"
puts "empty?: #{q.empty?}"
puts "peek: #{q.peek}"
puts "remove: #{q.remove}"

Benchmark.bm(30) do |x|
  nums_of_elements = [1, 100, 10000]

  nums_of_elements.each do |num_of_elements|
    s = Queue.new
    num_of_elements.times do |value|
      q.add value
    end
    x.report("add     num=%7d:" % [num_of_elements]) do
      q.add num_of_elements
    end
    x.report("remove  num=%7d:" % [num_of_elements]) do
      q.remove
    end
  end
end


=begin
                                     user     system      total        real
add     num=      1:             0.000014   0.000006   0.000020 (  0.000007)
remove  num=      1:             0.000004   0.000000   0.000004 (  0.000004)
add     num=    100:             0.000004   0.000001   0.000005 (  0.000003)
remove  num=    100:             0.000004   0.000001   0.000005 (  0.000005)
add     num=  10000:             0.000009   0.000002   0.000011 (  0.000006)
remove  num=  10000:             0.000005   0.000002   0.000007 (  0.000005)

Both add and remove run time are O(1) time.
=end
