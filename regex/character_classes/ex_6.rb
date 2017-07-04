# Are /(ABC|abc)/ and /[Aa][Bb][Cc]/ equivalent regex?
# If not, how do they differ? Can you provide an example of a
# string that would match one of these regex, but not the other?


# No, they are not the same regexes. First only matches ABC and abc sequence, 
# second would match sequence of a, b and c regardless of their case.

regexes = [/(ABC|abc)/, /[Aa][Bb][Cc]/]
strings = ["ABC", "AbC", "abC"]

strings.each do |word|
  regexes.each do |regex|
    if word.match(regex)
      puts "#{word} matches #{regex}"
    else
      puts "#{word} does not match #{regex}"
    end
  end
end