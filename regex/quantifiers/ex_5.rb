# Modify your regex from the previous exercise so the URL can be preceded or
# followed by whitespace, but is otherwise still on a line by itself.
# To test your regex with trailing whitespace, you will need to add some spaces
# to the end of some lines in the sample text.

# There should be 3 matches.

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
regex = /^\s*https?:\/\/\S*\s*$/
strings = ["http://launchschool.com/ ", 'https://mail.google.com/mail/u/0/#inbox ',
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