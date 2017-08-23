require "thread"

$i = 0
semaphore = Mutex.new

def add_num(num)
  num + 1
end

some_threads = (1..3).map do
  Thread.new do
    semaphore.synchronize do
      1_000_000.times { $i = add_num($i) }
    end
  end
end

some_threads.each { |t| t.join }
puts $i