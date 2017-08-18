def method1
  a = 1
  b = 2
  c = a + b
end

def method2
  a = 1
  b = 2
  c = a + b
  b # same as return b
end

p method1
p method2


def ret_things
  greeting = "Hello world"
  a = 1
  b = 2.0
  # a, b, 3, "four", greeting, 6 * 10       # => syntax error
  return a, b, 3, "four", greeting, 6 * 10
end

p ret_things

def ret_things_2
  greeting = "Hello world"
  a = 1
  b = 2.0
  # a, b, 3, "four", greeting, 6 * 10       # => syntax error
  return { a: b, :"3" => "four", greeting: 6 * 10 }
end

p ret_things_2