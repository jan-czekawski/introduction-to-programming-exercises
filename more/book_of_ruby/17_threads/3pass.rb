s = "start"

a = Thread.new do
  (1..10).each do
    s << "a"
  end
end

b = Thread.new do
  (1..10).each do
    s << "b"
  end
end

a.join
b.join
puts "#{s} end"