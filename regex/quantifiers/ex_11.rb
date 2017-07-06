# Challenge: Write a regex that matches lines of text that contain
# either 3 comma separated numbers or 6 or more comma separated numbers.
# Test your regex against these strings:

# 123,456,789,123,345
# 123,456,,789,123
# 23,56,7
# 13,45,78,23,45,34
# 13,45,78,23,45,34,56

# There should be 3 matches.

# regex = /^((\d+,){2}\d+|(\d+,){5,}\d+)$/
# regex = /(^(\d+,){2}\d+$|^(\d+,){5,}\d+$)/
regex = /^(\d+,){2}((\d+,){3,})?\d+$/


strings = ["123,456,789,123,345", "123,456,,789,123", "23,56,7",
           "13,45,78,23,45,34", "13,45,78,23,45,34,56"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end