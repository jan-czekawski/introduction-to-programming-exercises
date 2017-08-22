# simple example, but doesn't work as anticipated

words = %w(hello world goodbye mars)
numbers = [*1..10]

Thread.new {
  words.each { |word| puts word }
}

Thread.new {
  numbers.each { |number| puts number }
}