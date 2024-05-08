class Stack
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  attr_reader :size, :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  # O(1)
  def push(value)
    new_node = Node.new(value, @head)

    if @head.nil?
      @tail = new_node
    end

    @head = new_node
    @size += 1
    new_node
  end


  def pop
    return if @head.nil?

    tmp = @head.next_node
    @head.next_node = nil
    @head = tmp
    @size -= 1
  end

  def self.peek
    @head
  end

  def each
    current_node = @head

    while current_node.next_node do
      yield(current_node)
      current_node = current_node.next_node
    end
  end
end

require 'test/unit'

class TestStack < Test::Unit::TestCase
  def test_push
    stack = Stack.new
    stack.push(1)
    assert_equal(1, stack.size)
    assert_equal(1, stack.head.value)
    assert_nil(stack.head.next_node)

    stack.push(2)

    assert_equal(2, stack.size)
    assert_equal(2, stack.head.value)
    assert_equal(1, stack.head.next_node.value)
    assert_equal(1, stack.tail.value)
  end

  def test_pop
    stack = Stack.new

    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.pop

    assert_equal(2, stack.size)
    assert_equal(2, stack.head.value)
    assert_equal(1, stack.head.next_node.value)
    assert_equal(1, stack.tail.value)
  end

  def test_each
    stack = Stack.new

    stack.push(1)
    stack.push(2)
    stack.push(3)

    counter = 0

    stack.each do |node|
      assert_equal(3, node.value) if counter == 0
      assert_equal(2, node.value) if counter == 1
      assert_equal(1, node.value) if counter == 2
      counter += 1
    end
  end
end
