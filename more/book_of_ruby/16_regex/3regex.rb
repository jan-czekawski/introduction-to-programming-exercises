# display all full line comments in ruby file
File.foreach("1regex.rb") do |line|
  puts line if line =~ /^\s*#/
end