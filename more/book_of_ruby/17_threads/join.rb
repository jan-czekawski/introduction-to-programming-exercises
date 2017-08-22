words = %w(hello world goodbye mars)
nums = [*1..10]

Thread.new do
  words.each { |word| p word}
end.join

Thread.new do
  nums.each { |num| p num }
end.join