count = 0

File.foreach("1regex.rb") do |line|
  line.scan(/[a-zA-Z0-9]+/).each do |word|
    count += 1
    print "[#{count}] #{word}\n"
  end
end