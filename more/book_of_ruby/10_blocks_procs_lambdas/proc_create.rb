a = Proc.new { |x| x = x * 10; puts x }
b = lambda { |x| x = x * 10; puts x }
c = proc { |x| x.capitalize! }
d = ->(x) { x.capitalize! }