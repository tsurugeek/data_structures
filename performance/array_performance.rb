require 'benchmark'

# random access
Benchmark.bm(20) do |x|
  num_of_elements = [1, 100, 10000, 1000000, 100000000]

  num_of_elements.each do |num_of_element|
    a = Array.new(num_of_element) do |i|
      i
    end
    x.report("[]      num=%9d:" % [num_of_element]) do
      a[num_of_element - 1]
    end
    x.report("bsearch num=%9d:" % [num_of_element]) do
      a.bsearch{|e| e >= num_of_element - 1}
    end
    x.report("each    num=%9d:" % [num_of_element]) do
      a.each{|e| break if e == num_of_element - 1}
    end
  end
end

=begin
[]      num=        1:  0.000008   0.000006   0.000014 (  0.000004)
bsearch num=        1:  0.000007   0.000001   0.000008 (  0.000007)
each    num=        1:  0.000006   0.000001   0.000007 (  0.000007)
[]      num=      100:  0.000004   0.000001   0.000005 (  0.000004)
bsearch num=      100:  0.000005   0.000001   0.000006 (  0.000005)
each    num=      100:  0.000014   0.000001   0.000015 (  0.000015)
[]      num=    10000:  0.000005   0.000002   0.000007 (  0.000004)
bsearch num=    10000:  0.000007   0.000002   0.000009 (  0.000007)
each    num=    10000:  0.001072   0.000003   0.001075 (  0.001077)
[]      num=  1000000:  0.000008   0.000002   0.000010 (  0.000004)
bsearch num=  1000000:  0.000006   0.000001   0.000007 (  0.000007)
each    num=  1000000:  0.058900   0.000383   0.059283 (  0.060756)
[]      num=100000000:  0.000010   0.000002   0.000012 (  0.000006)
bsearch num=100000000:  0.000013   0.000002   0.000015 (  0.000013)
each    num=100000000:  5.445512   0.018514   5.464026 (  5.487644)
- the runtime of random access is O(1)
- the runtime of sequencial access looks like O(N)
- the performace of binary search is exellent!!!
=end
