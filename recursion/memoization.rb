# http://nithinbekal.com/posts/ruby-memoization/

module Memoization
  def memoize(name)
    @@lookup ||= Hash.new { |h, k| h[k] = {} }
    
    f = instance_method(name)
    
    # define_method(name) do |args| => factorial works, sum doesn't (2 args)
    define_method(name) do |*args|
      return @@lookup[name][args] if @@lookup[name].include?(args)
      @@lookup[name][args] = f.bind(self).call(args)
    end
  end
  
  def lookup
    @@lookup
  end
end

class Calculator
  # we're using extend (instead of include) because we need memoize as class method
  # so it can be called outside any method
  extend Memoization
  
  # memoize def fact(n) # => decomposition required if sum is defined
  memoize def fact((n))
    return 1 if n <= 1
    n * fact(n - 1)
  end
  
  memoize def sum((a, b))
    a + b
  end

end

p Calculator.new.fact(10)
p Calculator.new.sum(10, 20)

include Memoization
p lookup