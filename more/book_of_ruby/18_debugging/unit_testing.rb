require "test/unit"

def get_val
  100
end

class MyTest < Test::Unit::TestCase
  def test_get_val
    assert_equal(100, get_val)      
  end
end


