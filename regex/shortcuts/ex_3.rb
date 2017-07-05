# Write a regex that matches any 4 digit hexadecimal number
# that is both preceded and followed by whitespace. Test it 
# with these strings:

# Hello 4567 bye CDEF - cdef
# 0x1234 0x5678 0xABCD
# 1F8A done

regex = /\s\h\h\h\h\s/
strings = ["Hello 4567 bye CDEF - cdef", "0x1234 0x5678 0xABCD", "1F8A done"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end