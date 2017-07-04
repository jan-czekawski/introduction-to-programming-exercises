str = "Four score + seven"

regexes = [/[FX]/, /[e+]/, /[abAB]/, /[*+]/]

regexes.each do |regex|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

regex = /[abc][12]/
strings = ["a2", "Model 640c1", "a1 a2 a3 b1 b2 b3 c1 c2 c3 d1 d2 d3"] 
strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

def hex_digit?(char)
  char.match(/[0-9A-Fa-f]/)
end

regex = /[A-z]/ # check in RUBULAR => [], ^, _ will match /[a-zA-Z]/ => only alpha
strings = ["The United Nations", "The [eval] method", "Some^weird_stuff"] 
strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

regex = /[^y]/
strings = ["yes", "a", "by", "+/-", "ABCXYZ", "y", "yyyyy", "yyyayyy"]
strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

regex = /[^aeiou]/
strings = ["Four score and seven", "abcdefghijklmnopqrstuwvxyz", "123 hello +/* bye"]
strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end

regex = /[^x]/
strings = ["xyx"]
strings.each do |str|
  puts "#{str} matches #{regex}" if str.match(regex)
  puts "#{str} does not match #{regex}" unless str.match(regex)
end