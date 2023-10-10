class DoublyLinkedList
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
      @tail = @head
    else
      new_node = new_node
      @tail.next_node = new_node
      new_node.previous_node = @tail
      @tail = new_node
    end

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

class Node
  attr_reader :value, :next_node, :previous_node
  attr_accessor :next_node, :previous_node

  def initialize(value, next_node, previous_node)
    @value = value
    @next_node = next_node
    @previous_node = previous_node
  end
end

require 'test/unit'

class TestLinkedList < Test::Unit::TestCase
  def test_insert_and_size
    list = DoublyLinkedList.new
    assert_equal(0, list.size)

    list.insert(10)
    assert_equal(1, list.size)

    list.insert(20)
    assert_equal(2, list.size)
  end

  def test_empty_list
    list = DoublyLinkedList.new
    assert_nil(list.head)
    assert_nil(list.tail)
    assert_equal(0, list.size)
  end

  def test_delete
    list = DoublyLinkedList.new
    list.insert(10)
    list.insert(20)
    list.insert(30)

    assert_equal(3, list.size)
    assert_equal(10, list.head.value)
    assert_equal(30, list.tail.value)
    assert_equal(20, list.head.next_node.value)
    assert_equal(20, list.tail.previous_node.value)

    # delete from middle
    list.delete(20)
    assert_equal(2, list.size)
    assert_equal(10, list.head.value)
    assert_equal(30, list.tail.value)
    assert_equal(30, list.head.next_node.value)
    assert_equal(10, list.tail.previous_node.value)
  end

  def test_find
    list = DoublyLinkedList.new
    list.insert(10)
    list.insert(20)
    list.insert(30)

    assert_equal(10, list.find(10).value)
    assert_equal(20, list.find(20).value)
    assert_equal(30, list.find(30).value)
  end
end

list = DoublyLinkedList.new
list.insert(1)
list.insert(2)
list.insert(3)

p list.size
p list.head
p list.tail
list.delete(3)

puts "\n"
p list.size
p list.head
p list.tail
