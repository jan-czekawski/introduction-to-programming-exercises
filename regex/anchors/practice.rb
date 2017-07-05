regex = /^cat/
strings = ["cat", "catastrophy", "wildcat", "I love my cat", "<cat>"]

strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

regex = /cat$/
strings = ["cat", "catastrophy", "wildcat", "I love my cat", "<cat>"]

strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

regex = /^cat$/
strings = ["cat", "catastrophy", "wildcat", "I love my cat", "<cat>"]

strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

regexes = [/^red/, /^blue/]
strings = ["red fish\nblue fish"]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end


regexes = [/fish$/, /shirt$/]
strings = ["red fish\nred shirt"]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/\Ared/, /\Ablue/, /shirt\z/, /fish\z/]
strings = ["red fish\nblue fish", "red fish\nred shirt"]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/\b\w\w\w\b/]
strings = ["One fish,", "Two fish,", "Red fish,", "Blue fish.", "123 456 7890"]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/\Bjohn/i]
strings = ["John Silver", "Rand Johnson", "Duke pettijohn", "Joe_Johnson"]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end
