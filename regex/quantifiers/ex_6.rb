# Modify your regex from the previous exercise so the URL can appear 
# anywhere on each line, so long as it begins at a word boundary.

# There should be 5 matches.

# http://launchschool.com/
# https://mail.google.com/mail/u/0/#inbox
# htpps://example.com
# Go to http://launchschool.com/
# https://user.example.com/test.cgi?a=p&c=0&t=0&g=0 hello
#     http://launchschool.com/


regex = /\bhttps?:\/\/\S*/
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