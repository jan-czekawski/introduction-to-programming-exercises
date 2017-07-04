# Challenge: write a regex that matches a string that looks
# like a simple negated character class range, e.g., '[^a-z]'.
# (Your answer should match exactly 6 characters.) Test it with these strings:

# The regex /[^a-z]/i matches any character that is
# not a letter. Similarly, any non-digit is matched
# by /[^0-9]/, while /[^A-Z]/ matches any character
# that is not an uppercase letter. Beware: /[^+-<]/
# is at best obscure, and may even be wrong.

regex = /\/\[\^[\w]\-[\w]\]\//
# regex = /\/\[\^[0-9a-zA-Z]-[0-9a-zA-Z]\]\//
# regex = /\/\[\^[0-9a-zA-Z]\-[0-9a-zA-Z]\]\//
# regex = /\[\^[\w]-[\w]\]\//

# regex = /[\[][\^][0-9A-Za-z]-[0-9A-Za-z][\]]/
strings = ["The regex /[^a-z]/i matches any character that is
            not a letter. Similarly, any non-digit is matched
            by /[^0-9]/, while /[^A-Z]/ matches any character
            that is not an uppercase letter. Beware: /[^+-<]/
            is at best obscure, and may even be wrong."]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end