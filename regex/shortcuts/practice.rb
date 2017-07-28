regex = /./
strings = ["This text contains letters, numbers, punctuation,
whitespace, and even newline characters. 99988222.
Everything in it should match the /./ pattern."]

strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

regex = /\s/
strings = ["Four score", "Four\tscore", "Four-score\n", "Four-score"]

strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

regex = /\S/
strings = ["a b", " \t\r\n\f\v"]

strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

regexes = [/\d/, /\D/, /\h/, /\H/]
strings = ["Launch School", "July 4th, 1776", "0xABCDef12"] # => 'x' is \H

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/\w/, /\W/]
strings = ["Launch School", "July 4th, 1776", "one_word_two_words", "Don't fence me in."]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end