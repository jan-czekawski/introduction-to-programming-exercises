count = 0
File.foreach("1regex.rb") do |line|
  count += line.scan(/[a-zA-Z0-9]+/).size
end

puts "There are #{count} words in this file."