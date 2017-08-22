file_out1 = File.open("comments.txt", "w")
file_out2 = File.open("no_comments.txt", "w")

File.foreach('1regex.rb') do |line|
  if line =~ /^\s*#/
    file_out1.puts(line)
  else
    file_out2.puts(line)
  end
end

file_out1.close
file_out2.close