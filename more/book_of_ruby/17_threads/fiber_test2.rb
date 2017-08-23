fiber = Fiber.new do |first|
  second = Fiber.yield(first + 2)
end

puts fiber.resume(10)
puts fiber.resume(14)
# puts fiber.resume(18) # dead fiber => error

f = Fiber.new do |s|
  puts "In Fiber #1 (a) : " + s
  puts "In Fiber #1 (b) : " + s
  Fiber.yield
  puts "In Fiber #1 (c) : " + s
end

f2 = Fiber.new do |s|
  puts "In Fiber #2 (a) : " + s
  puts "In Fiber #2 (b) : " + s
  Fiber.yield
  puts "In Fiber #2 (c) : " + s
end

f.resume("hello")
f2.resume("hi")
puts "world"
f2.resume
f.resume