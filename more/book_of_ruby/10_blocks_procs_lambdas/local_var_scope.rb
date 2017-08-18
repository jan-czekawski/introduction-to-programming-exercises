def foo
  a = 100
  [1, 2, 3].each do |b|
    c = b
    a = b
    print "a=#{a}, b=#{b}, c=#{c}\n"
  end
  print "Outside block: a=#{a}\n"
  # print "Outside block: b=#{b}\n" # => error
  # print "Outside block: c=#{c}\n" # => error
end

foo

p "for loop".upcase

def foo2
  a = 100
  for b in [1, 2, 3] do
    c = b
    a = b
    p "a=#{a}, b=#{b}, c=#{c}"
  end
  p "Outside block: a=#{a}, b=#{b}, c=#{c}"
end

foo2