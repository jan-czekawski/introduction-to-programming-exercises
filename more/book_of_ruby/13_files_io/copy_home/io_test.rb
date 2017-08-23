IO.foreach("test.txt") { |line| print line }

lines = IO.readlines("test.txt")
p lines
p lines.class