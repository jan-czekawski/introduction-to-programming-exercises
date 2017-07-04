# Base 20 digits include the decimal digits 0 through 9,
# and the letters A through J in upper or lowercase. Write
# a regex that matches base 20 digits. Test it with these strings:

# 0xDEADBEEF
# 1234.5678
# Jamaica
# plow ahead
# Theere should be 28 matches.



regex = /[0-9a-j]/i
strings = ["0xDEADBEEF", "1234.5678", "Jamaica", "plow ahead"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end