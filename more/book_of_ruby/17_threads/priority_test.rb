count1, count2 = 0, 0

a = Thread.new do
      loop { count1 += 1 }
    end
    
b = Thread.new do
      loop { count2 += 1 }
    end

b.priority = -2

p sleep(1)
p count1
p count2