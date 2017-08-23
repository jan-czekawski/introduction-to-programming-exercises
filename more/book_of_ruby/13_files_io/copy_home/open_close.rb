# f = File.new("myfile.txt", "w")
# p f
# f.puts "I", "wandered", "lonely", "as", "a", "cloud"
# p f
# f.close
# p f

f = File.new("myfile.txt", "w")
f.puts "I", "wandered", "lonely", "as", "a", "cloud"
f.close

char_count = 0
line_count = 0
f = File.new("myfile.txt", "r")
# while !(f.eof) do
until f.eof do      # until end of file
  c = f.getc        # get single char
  
  if c.ord == 10    # test ASCII code => if it's "\n"
    line_count += 1
    puts " <End Of Line #{line_count}>"
  else
    putc c          # put single char to screen
    char_count += 1
  end
end

if f.eof
  puts "<End Of File>"
end

f.close
puts "This file contains #{line_count} lines and #{char_count} characters."

