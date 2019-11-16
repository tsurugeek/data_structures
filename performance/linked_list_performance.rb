require 'benchmark'
require_relative '../src/linked_list'

# easy test
list = LinkedList.new
list.push("10_v")
puts list
list.push("20_v")
puts list
list.push("30_v")
puts list

puts list.index("10_v")
puts list.index("20_v")
puts list.index("30_v")


Benchmark.bm(20) do |x|
  list = LinkedList.new
  num_of_elements = [1, 10, 100, 1000, 10000, 100000]

  num_of_elements.each do |num_of_element|
    num_of_element.times do |i|
      list.push "#{i}_v"
    end
    x.report("index num=%7d:" % [num_of_element]) do
      list.index "#{num_of_element}_v"
    end
    x.report("push  num=%7d:" % [num_of_element]) do
      list.push "#{num_of_element}_v"
    end
  end
end

Benchmark.bm(20) do |x|
  list = Array.new
  num_of_elements = [1, 10, 100, 1000, 10000, 100000]

  num_of_elements.each do |num_of_element|
    num_of_element.times do |i|
      list.push "#{i}_v"
    end
    x.report("index num=%7d:" % [num_of_element]) do
      list.index "#{num_of_element}_v"
    end
    x.report("push  num=%7d:" % [num_of_element]) do
      list.push "#{num_of_element}_v"
    end
  end
end

=begin
                           user     system      total        real
index num=      1:     0.000014   0.000008   0.000022 (  0.000015)
push  num=      1:     0.000005   0.000001   0.000006 (  0.000004)
index num=     10:     0.000005   0.000001   0.000006 (  0.000006)
push  num=     10:     0.000004   0.000000   0.000004 (  0.000004)
index num=    100:     0.000018   0.000001   0.000019 (  0.000019)
push  num=    100:     0.000003   0.000001   0.000004 (  0.000003)
index num=   1000:     0.000149   0.000001   0.000150 (  0.000150)
push  num=   1000:     0.000003   0.000001   0.000004 (  0.000004)
index num=  10000:     0.001619   0.000007   0.001626 (  0.001632)
push  num=  10000:     0.000006   0.000001   0.000007 (  0.000006)
index num= 100000:     0.015146   0.000042   0.015188 (  0.015319)
push  num= 100000:     0.000010   0.000002   0.000012 (  0.000010)
- index runtime looks like O(N) time, because it find a element through all elements step by step.
- push runtime is O(1) time, because it only add to last element.
                           user     system      total        real
index num=      1:     0.000004   0.000001   0.000005 (  0.000005)
push  num=      1:     0.000002   0.000001   0.000003 (  0.000003)
index num=     10:     0.000002   0.000001   0.000003 (  0.000003)
push  num=     10:     0.000002   0.000001   0.000003 (  0.000003)
index num=    100:     0.000004   0.000001   0.000005 (  0.000004)
push  num=    100:     0.000002   0.000001   0.000003 (  0.000003)
index num=   1000:     0.000015   0.000001   0.000016 (  0.000017)
push  num=   1000:     0.000002   0.000000   0.000002 (  0.000003)
index num=  10000:     0.000203   0.000004   0.000207 (  0.000211)
push  num=  10000:     0.000004   0.000001   0.000005 (  0.000004)
index num= 100000:     0.002487   0.000006   0.002493 (  0.002494)
push  num= 100000:     0.000005   0.000000   0.000005 (  0.000018)
- index runtime of Ruby native Array is so less than my custom LinkedList. Good implementation!!!
=end
