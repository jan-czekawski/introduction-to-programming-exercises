# Write a regex that matches any line of text that contains nothing but a
# URL. For the purposes of this exercise, a URL begins with http:// or https://,
# and continues until a whitespace character or end of line is detected.
# Test your regex with these strings:

# http://launchschool.com/
# https://mail.google.com/mail/u/0/#inbox
# htpps://example.com
# Go to http://launchschool.com/
# https://user.example.com/test.cgi?a=p&c=0&t=0&g=0 hello
#     http://launchschool.com/

# There should be 2 matches.
# regex = /(cat|cats)$/
# strings = ["wildcat", "catastrophy", "bobcats"]

# regex = /^https+\:\/\/.*/
regex = /^https?:\/\/\S*$/
strings = ["http://launchschool.com/", 'https://mail.google.com/mail/u/0/#inbox',
          "htpps://example.com", "Go to http://launchschool.com/",
          "https://user.example.com/test.cgi?a=p&c=0&t=0&g=0 hello",
          "    http://launchschool.com/"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end