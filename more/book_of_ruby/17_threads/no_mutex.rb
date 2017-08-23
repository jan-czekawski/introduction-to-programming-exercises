# user 1.8.7

$i = 0

def add_num(num)
  num + 1
end

some_threads = (1..3).map do
  Thread.new do
    1_000_000.times { $i = add_num($i) }
  end
end

some_threads.each { |t| t.join }
p $i