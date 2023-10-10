require 'test/unit'

# O(n^2) 3 items 3 - 1 loops which 3 if we remove the constant
def sort(array)
  return array if array.size <= 1

  move = false
  index = 0

  while move do
    while index < array.size do
      current = array[index]
      next_item = array[index + 1]

      if current > next_item
        array[index] = next_item
        array[index + 1] = current
      end

      index += 1
    end
    index = 0
  end
end

class TestSort < Test::Unit::TestCase
  def test_reverse_array_happy_path
    array = [1, 2, 3]
    expected = [1, 2, 3]
    result = sort(array)

    assert_equal expected, result
  end

  def test_reverse_array_non_happy_path
    array = [1, 3, 2]
    expected = [1, 2, 3]
    result = sort(array)

    assert_equal expected, result
  end

  def test_reverse_array_unhappy_path
    array = [3, 2, 1]
    expected = [1, 2, 3]
    result = sort(array)

    assert_equal expected, result
  end
end

