regexes = [/\b\d\d\d\d*\b/]
strings = ["Four and 20 black birds", "365 days in a year, 100 years in a century.",
           "My phone number is 222-555-1212.", "My serial number is 345678912."]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/co*t/]
strings = ["ct", "cot", "coot", "cooot"]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/1(234)*5/]
strings = ["15", "12345", "12342342345", "1234235"]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/\b\d\d\d+\b/]
strings = ["Four and 20 black birds", "365 days in a year, 100 years in a century.",
           "My phone number is 222-555-1212.", "My serial number is 345678912."]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/x+/]
strings = ["a single x is matched.", "As is a string of xxxxx like that."]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/coo?t/]
strings = ["Scott scoots but doesn't act coot."]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/\b\d\d\d\d-?\d\d-?\d\d\b/]
strings = ["20170101", "2017-01-01", "2017/01/01"]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/h?/]
strings = ["his", "is", "ish"]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/\b\d{10}\b/]
# strings = ["2225551212", "1234567890", "123456789", "12345678900"]
strings = %w(2225551212 1234567890 123456789 12345678900)
strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/\b\d{10}\b/]
# strings = ["2225551212", "1234567890", "123456789", "12345678900"]
strings = ["Four and 20 black birds",
           "365 days in a year, 100 years in a century.",
           "My phone number is 222-555-1212.",
           "My serial number is 345678912."]
           
strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/\b\d{3,}\b/]
strings = ["Four and 20 black birds",
           "365 days in a year, 100 years in a century.",
           "My phone number is 222-555-1212.",
           "My serial number is 345678912."]
           
strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/\b[a-z]{5,8}\b/i]
strings = ["Bizarre", "a", "one two three four five six seven eight nine",
           "sensitive", "dropouts"]
           
strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

regexes = [/a[abc]*c/]
strings = ["xabcbcbacy"]
           
strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end


regexes = [/a[abc]*?c/]
strings = ["xabcbcbacy"]
strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end