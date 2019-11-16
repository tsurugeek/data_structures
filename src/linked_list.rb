class LinkedList
  def initialize
    @size = 0
    @first = nil
    @last = nil
  end

  def first
    @first
  end

  def last
    @last
  end

  def push value
    element = LinkedListElement.new(value)

    # connect
    if @first.nil?
      @first = element
      @last = element
    else
      @last.next = element
      element.prev = @last
      @last = element
    end
    @size += 1
  end

  def index value
    element = @first
    i = 0

    loop do
      if element.nil?
        return nil
      end

      if element.value == value
        return i
      end

      element = element.next
      i += 1
    end


  end

  def to_s
    "first=#{@first.value}, last=#{@last.value}, size=#{@size}"
  end
end

# value container
class LinkedListElement
  def initialize value
    @value = value
    @prev = nil
    @next = nil
  end

  def value
    @value
  end

  def next
    @next
  end

  def prev
    @prev
  end

  def prev= element
    @prev = element
  end

  def next= element
    @next = element
  end
end
