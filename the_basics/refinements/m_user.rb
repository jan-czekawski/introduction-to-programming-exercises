require "./m"

using M

class MUser
  def call_foo(x)
    x.foo
  end
end

# refinement is active in this file