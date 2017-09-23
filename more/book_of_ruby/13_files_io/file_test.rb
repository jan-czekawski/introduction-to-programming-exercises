File.foreach("test.txt") { |ln| print ln }

all_lines = File.readlines("test.txt")
p all_lines