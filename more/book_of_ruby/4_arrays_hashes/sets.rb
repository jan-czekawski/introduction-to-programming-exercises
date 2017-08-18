require "set"
p s1 = Set.new([1, 2, 3, 4, 5, 2])
p s2 = Set.new([1, 1, 2, 3, 4, 4, 5, 1])
p s3 = Set.new([1, 2, 100])
# p s4 = Set.new(10, 20, 30) # => error
p week_days = Set.new(%w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday))

p s1.add(1000)
p s2.add(9999999)
p s1.merge(s2)

p week_days.sort
p week_days.to_a.sort