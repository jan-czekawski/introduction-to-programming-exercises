s = ""

a = Thread.new do
  s << "a"
  Thread.pass
  s << "b"
  Thread.pass
  s << "c"
end

b = Thread.new do
  s << "x"
  Thread.pass
  s << "y"
  Thread.pass
  s << "z"
end

a.join
b.join
puts s