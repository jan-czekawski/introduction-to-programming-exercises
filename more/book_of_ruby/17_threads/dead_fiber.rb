f = Fiber.new do
  puts "In fiber"
  Fiber.yield("yielding")
  puts "Still in fiber"
  Fiber.yield("yielding again")
  puts "But still in fiber"
end

p f

puts "a"
puts f.resume
puts "b"
puts f.resume
puts "c"
puts f.resume
puts "d"

require "fiber"

if f.alive?
  puts f.resume
else
  puts "Error: call to dead fiber..."
end
