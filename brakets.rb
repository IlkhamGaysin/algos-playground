OPEN_CLOSED_BRACKETS_MAP = {
  '(' => ')',
  '{' => '}',
  '[' => ']',
}
CLOSED_OPEN_BRACKETS_MAP = {
  ')' => '(',
  '}' => '{',
  ']' => '[',
}

def valid_brackets?(string)
  return false if string.empty?

  stack = []

  string.each_char do |char|
    if OPEN_CLOSED_BRACKETS_MAP[char]
      stack.push(char)
    else
      if stack.last == CLOSED_OPEN_BRACKETS_MAP[char] || stack.empty?
        stack.pop
      else
        return false
      end
    end
  end

  stack.empty?
end

require 'test/unit'

class TestValidBrackets < Test::Unit::TestCase
  def test_valid_brackets
    assert_equal true, valid_brackets?('[[{}]()]')
    assert_equal true, valid_brackets?('{([])}')
    assert_equal true, valid_brackets?('()')
    assert_equal true, valid_brackets?('{}')
  end

  def test_invalid_brackets
    assert_equal false, valid_brackets?('(}')
    assert_equal false, valid_brackets?('({)]')
  end
end
