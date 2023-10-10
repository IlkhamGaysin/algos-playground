# O(n)
def shuffle(array)
  index = 0
  length = array.length

  while index < length
    tmp = array[index]
    rand_index = randomized_index(length)

    array[index] = array[rand_index]
    array[rand_index] = tmp

    index += 1
  end

  array
end


def randomized_index(size)
  rand(0..size - 1)
end

require 'test/unit'

class TestShuffle < Test::Unit::TestCase
  def test_shuffle_array_happy_path
    array = [1, 2, 3]
    expected = [3, 1, 2]

    # TODO: Mock
    def randomized_index(size)
      0
    end

    result = shuffle(array)


    def randomized_index(size)
      rand(0..size - 1)
    end

    assert_equal expected, result
  end
end
