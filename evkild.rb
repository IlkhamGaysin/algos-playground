# O(n)
def evklid_algo(a, b)
  div = 1
  max = a > b ? a : b
  temp = 0

  while div <= max do
    temp = div if a % div == 0 && b % div == 0
    div += 1
  end

  temp
end

def alt_evklid_algo(a, b)
  while b != 0 do
    temp = b
    b = a % b
    a = temp
  end

  a
end

p evklid_algo(49, 14)

require 'test/unit'

class EvklidAlgo < Test::Unit::TestCase
  def test_evklid_algo
    assert_equal(7, evklid_algo(49, 14))
    assert_equal(5, evklid_algo(10, 15))
  end

  def test_alt_evklid_algo
    assert_equal(7, alt_evklid_algo(49, 14))
    assert_equal(5, alt_evklid_algo(10, 15))
  end
end
