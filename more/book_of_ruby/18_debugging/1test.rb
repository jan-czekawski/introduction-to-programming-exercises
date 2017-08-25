require "test/unit"

class TestClass
  def initialize(value)
    @value = value * 10
  end
  
  def get_val
    @value
  end
end

class MyTest < Test::Unit::TestCase
  def test1
    t = TestClass.new(10)
    assert_equal(100, t.get_val)
    assert_equal(101, t.get_val)
    # assert_equal(101, t.get_val + 1)
    assert(100 != t.get_val)
    # assert(100 != t.get_val + 1)
  end
  
  def test2
    assert_equal(1000, TestClass.new(100).get_val)
  end
end