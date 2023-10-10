class DoublyLinkedList
  class Node
    attr_reader :value, :next_node, :previous_node
    attr_accessor :next_node, :previous_node

    def initialize(value, next_node, previous_node)
      @value = value
      @next_node = next_node
      @previous_node = previous_node
    end
  end

  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  # O(1)
  def insert(value)
    new_node = Node.new(value, nil, nil)

    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
      new_node.previous_node = @tail
    end

    @tail = new_node

    @size += 1

    new_node
  end

  # O(n)
  def find(value)
    return if @head.nil?
    return @head if @head.value == value
    return @tail if @tail.value == value

    current_node = @head

    while current_node do
      break current_node if current_node.value == value
      current_node = current_node.next_node
    end

    current_node
  end

  # O(n)
  # O(1) if deleting from head or tail
  def delete(value)
    if @head.value == value && @tail.value == value
      @head = nil
      @tail = nil
      @size -= 1
      return
    end

    if @head.value == value
      @head = @head.next_node
      @size -= 1
      return
    end

    if @tail.value == value
      @tail = @tail.previous_node
      @size -= 1
      return
    end

    current_node = @head

    while current_node && current_node.next_node do
      next_node = current_node.next_node

      if next_node.value == value
        if next_node == @tail
          current_node.next_node = nil
          @tail.previous_node = nil
          @tail = current_node
          @size -= 1

          break
        else
          current_node.next_node = next_node.next_node
          next_node.next_node.previous_node = current_node
          next_node.next_node = nil
          next_node.previous_node = nil
          @size -= 1

          break
        end
      end

      current_node = current_node.next_node
    end
  end
end

require 'test/unit'

class TestDoublyLinkedList < Test::Unit::TestCase
  def test_insert_and_size
    doubly_list = DoublyLinkedList.new
    assert_equal(0, doubly_list.size)

    doubly_list.insert(10)
    assert_equal(1, doubly_list.size)

    doubly_list.insert(20)
    assert_equal(2, doubly_list.size)
  end

  def test_empty_list
    doubly_list = DoublyLinkedList.new
    assert_nil(doubly_list.head)
    assert_nil(doubly_list.tail)
    assert_equal(0, doubly_list.size)
  end

  def test_delete
    doubly_list = DoublyLinkedList.new
    doubly_list.insert(10)
    doubly_list.insert(20)
    doubly_list.insert(30)

    assert_equal(3, doubly_list.size)
    assert_equal(10, doubly_list.head.value)
    assert_equal(30, doubly_list.tail.value)
    assert_equal(20, doubly_list.head.next_node.value)
    assert_equal(20, doubly_list.tail.previous_node.value)

    # delete from middle
    doubly_list.delete(20)
    assert_equal(2, doubly_list.size)
    assert_equal(10, doubly_list.head.value)
    assert_equal(30, doubly_list.tail.value)
    assert_equal(30, doubly_list.head.next_node.value)
    assert_equal(10, doubly_list.tail.previous_node.value)
  end

  def test_find
    doubly_list = DoublyLinkedList.new
    doubly_list.insert(10)
    doubly_list.insert(20)
    doubly_list.insert(30)

    assert_equal(10, doubly_list.find(10).value)
    assert_equal(20, doubly_list.find(20).value)
    assert_equal(30, doubly_list.find(30).value)
  end
end

doubly_list = DoublyLinkedList.new
doubly_list.insert(1)
doubly_list.insert(2)
doubly_list.insert(3)

p doubly_list.size
p doubly_list.head
p doubly_list.tail
doubly_list.delete(3)

puts "\n"
p doubly_list.size
p doubly_list.head
p doubly_list.tail
