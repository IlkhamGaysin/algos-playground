# given sorted array of positive or negative integers
# task to return sorted asc array of squares of those integers
# input: [-4, -1, 0, 3, 10]
# output: [0, 1, 9, 16, 100]
# input [-4, -1, 0]
# output [0, 1, 16]
def sorted_square(arr)
  left = 0
  right = arr.size - 1

  result = []

  while left <= right do
    left_square = (arr[left].abs) ** 2
    right_square = (arr[right].abs) ** 2
    p left_square
    p right_square
    p result
    p "\n"
    if left_square > right_square
      result.unshift(left_square)
      left += 1
    else
      result.unshift(right_square)
      right -= 1
    end
  end

  result
end

require 'test/unit'

class TestSortedSquare < Test::Unit::TestCase
  def test_sorted_square
    # assert_equal([-4, -1, 0], sorted_square([0, 1, 16]))
    # assert_equal([0, 1, 9, 16, 100], sorted_square([-4, -1, 0, 3, 10]))
  end
end
