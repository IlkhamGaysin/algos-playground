require 'minitest/autorun'

def reverse(list)
  reversed_list = []
  pointer = -1

  while list[pointer] do
    reversed_list << list[pointer]
    pointer -= 1
  end

  reversed_list
end

class TestReverse < MiniTest::Test
  def test_reverse_array_happy_path
    array = [1, 2, 3, 4, 5]
    expected = [5, 4, 3, 2, 1]
    result = reverse(array)

    assert_equal expected, result
  end

  def test_reverse_array_unhappy_path
    arr = []
    expected = []
    result = reverse(arr)

    assert_equal expected, result
  end
end
