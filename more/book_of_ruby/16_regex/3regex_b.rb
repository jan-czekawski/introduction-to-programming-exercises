# comment without a pound sign (#)

File.foreach("1regex.rb") do |line|
  puts $1 if line =~ /^\s*#(.*)/
end