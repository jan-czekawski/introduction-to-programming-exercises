def factor(n)
  n == 1 ? 1 : n * factor(n - 1)
end

t1 = Thread.new do
       0.upto(50) { factor(50); print "t1\n" }
     end

t2 = Thread.new do
       0.upto(50) { factor(50); print "t2\n" }
     end
     
t3 = Thread.new do
       0.upto(50) { factor(50); print "t3\n" }
     end

t1.priority = 0
t2.priority = 0
t3.priority = 0

