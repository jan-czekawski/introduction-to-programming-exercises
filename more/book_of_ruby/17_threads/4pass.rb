# use 1.8

arr = []

t1 = Thread.new do
  Thread.stop
  (1..10).each do
    p "enter first loop"
    arr << Thread.current.to_s
    Thread.pass
  end
end

t2 = Thread.new do
  Thread.stop
  (1..10).each do
    p "enter second loop"
    arr << Thread.current.to_s
    Thread.pass
  end
end

puts "Starting threads..."
t1.run
t2.run
t1.join
p "1 was activated"
t2.join
p "2 was activated"
puts arr