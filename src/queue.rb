class Queue

  def initialize
    @first = nil
    @end = nil
  end

  def add value
    if self.empty?
      @first = @end = QueueElement.new(value)
    else
      new_element = QueueElement.new(value)
      @end.next = new_element
      @end = new_element
    end

    @first = @end if @first.nil?
  end

  def remove
    if self.empty?
      nil
    else
      value = @first.value
      @first = @first.next
      value
    end
  end

  def peek
    @first
  end

  def empty?
    @first.nil?
  end

end

class QueueElement
  def initialize value
    @value = value
  end

  def value
    @value
  end

  def next
    @next_element
  end

  def next=(next_element)
    @next_element = next_element
  end

  def to_s
    "#{@value}"
  end
end
