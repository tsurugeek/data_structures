class Stack

  def initialize
    @top = nil
  end

  def push value
    @top = StackElement.new(value, @top)
  end

  def pop
    if self.empty?
      nil
    else
      value = @top.value
      @top = @top.prev
      value
    end
  end

  def peek
    @top
  end

  def empty?
    @top.nil?
  end

end

class StackElement
  def initialize value, prev_element
    @value = value
    @prev_element = prev_element
  end

  def value
    @value
  end

  def prev
    @prev_element
  end

  def to_s
    "#{@value}"
  end
end
