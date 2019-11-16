require_relative 'linked_list'

class HashTable

  def initialize capacity=10
    @array = Array.new(capacity) do
      LinkedList.new
    end
    @capacity = capacity
  end

  def put key, value
    linked_list = @array[calc_index(calc_hashcode(key))]
    # TODO: when add a key that is already stored, should override it
    linked_list.push([key, value])
  end

  def get key
    linked_list = @array[calc_index(calc_hashcode(key))]
    element = linked_list.last

    loop do
      if element.nil?
        return nil
      end

      if element.value[0] == key
        return element.value[1]
      end

      element = element.prev
    end
  end

  # TODO: remove

  private

  def calc_hashcode key
    key.hash
  end

  def calc_index hashcode
    hashcode % @capacity
  end
end


#---
