require 'benchmark'
require_relative '../src/hash_table'

# easy test1
t = HashTable.new(10)
t.put(10, '10_v')
puts t.get(10)
t.put(20, '20_v')
puts t.get(20)
t.put(30, '30_v')
puts t.get(30)
t.put(30, '30_vv')
puts t.get(30)

# easy test2
1000.times do |key|
  t.put key, "#{key}_v"
end
1000.times do |key|
  raise StandardError.new() unless t.get(key) == "#{key}_v"
end


Benchmark.bm(30) do |x|
  capacities = [1, 100, 10000]
  num_of_keys = [1, 100, 10000]

  capacities.each do |capacity|
    num_of_keys.each do |num_of_key|
      t = HashTable.new(capacity)
      num_of_key.times do |key|
        t.put key, "#{key}_v"
      end
      x.report("get cap=%7d, num=%7d:" % [capacity, num_of_key]) do
        t.get num_of_key
      end
      x.report("put cap=%7d, num=%7d:" % [capacity, num_of_key]) do
        t.put num_of_key, "#{num_of_key}_v"
      end
    end
  end
end

Benchmark.bm(30) do |x|
  capacities = [1, 100, 10000]
  num_of_keys = [1, 100, 10000]

  # capacities.each do |capacity|
    num_of_keys.each do |num_of_key|
      t = Hash.new
      num_of_key.times do |key|
        t[key] = "#{key}_v"
      end
      x.report("get num=%7d:" % [num_of_key]) do
        t[num_of_key]
      end
      x.report("put num=%7d:" % [num_of_key]) do
      end
    end
  # end
end

=begin
                                     user     system      total        real
get cap=      1, num=      1:    0.000010   0.000007   0.000017 (  0.000007)
put cap=      1, num=      1:    0.000006   0.000001   0.000007 (  0.000006)
get cap=      1, num=    100:    0.000018   0.000001   0.000019 (  0.000018)
put cap=      1, num=    100:    0.000005   0.000001   0.000006 (  0.000005)
get cap=      1, num=  10000:    0.001400   0.000003   0.001403 (  0.001399)
put cap=      1, num=  10000:    0.000006   0.000001   0.000007 (  0.000006)
- get runtime is more than O(1), because it talkes O(N) time to search a element in a linked list
- put runtime is O(1), because i takes O(1) to push a element to a linked list
get cap=    100, num=      1:    0.000004   0.000001   0.000005 (  0.000005)
put cap=    100, num=      1:    0.000004   0.000001   0.000005 (  0.000005)
get cap=    100, num=    100:    0.000003   0.000001   0.000004 (  0.000004)
put cap=    100, num=    100:    0.000004   0.000001   0.000005 (  0.000004)
get cap=    100, num=  10000:    0.000024   0.000002   0.000026 (  0.000022)
put cap=    100, num=  10000:    0.000005   0.000001   0.000006 (  0.000006)
- when cap <= num get, get runtime is O(1), because the number of each linked list elements is less thna or equals to 1
- when cap > num get, get runtime is a bit more than O(1), because the number of each linked list elements is more than  1
- put runtime is O(1)
get cap=  10000, num=      1:    0.000013   0.000002   0.000015 (  0.000009)
put cap=  10000, num=      1:    0.000006   0.000001   0.000007 (  0.000006)
get cap=  10000, num=    100:    0.000005   0.000001   0.000006 (  0.000004)
put cap=  10000, num=    100:    0.000004   0.000001   0.000005 (  0.000004)
get cap=  10000, num=  10000:    0.000016   0.000003   0.000019 (  0.000013)
put cap=  10000, num=  10000:    0.000009   0.000001   0.000010 (  0.000010)
                                     user     system      total        real
get num=      1:                 0.000004   0.000001   0.000005 (  0.000005)
put num=      1:                 0.000003   0.000001   0.000004 (  0.000004)
get num=    100:                 0.000004   0.000001   0.000005 (  0.000005)
put num=    100:                 0.000003   0.000001   0.000004 (  0.000005)
get num=  10000:                 0.000012   0.000003   0.000015 (  0.000007)
put num=  10000:                 0.000004   0.000001   0.000005 (  0.000005)
- good implementation!!!
=end
