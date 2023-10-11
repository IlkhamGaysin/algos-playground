class Queue
  class Node
    attr_accessor :next, :value

    def initialize(value, next_node = nil)
      @value = value
      @next = nil
    end
  end

  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def enqueue(item)
    node = Node.new(item)

    if @head.nil?
      @head = node
    else
      @tail.next = node
    end

    @size += 1
    @tail = node
  end

  def dequeue
    return if @head.nil?

    @head = @head.next
    @tail = nil if @head.nil?
    @size -= 1
  end

  def peek
    @head.value if @size > 0
  end
end

require 'test/unit'

class TestQueue < Test::Unit::TestCase
  def test_enqueue
    queue = Queue.new
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    assert_equal(1, queue.peek)
    assert_equal(3, queue.size)
    assert_equal(1, queue.head.value)
    assert_equal(3, queue.tail.value)
  end

  def test_dequeue
    queue = Queue.new
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    queue.dequeue
    assert_equal(2, queue.peek)
    assert_equal(2, queue.size)
    assert_equal(2, queue.head.value)
    assert_equal(3, queue.tail.value)
  end
end
