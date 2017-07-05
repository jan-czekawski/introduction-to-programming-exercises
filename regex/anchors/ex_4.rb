# Challenge: Write a regex that matches an entire line of text 
# that begins with the word A or The, followed by a space, a 4-letter word,
# another space, and then the word dog or cat. Test your solution
# with these strings:

# A grey cat
# The lazy dog
# The white cat
# A loud dog
# Go away dog
# The ugly rat
# The lazy loud dog

# There should be 3 matches.

# regex = /^(A|The) [a-z][a-z][a-z][a-z] (dog|cat)$/i
regex = /^(A|The) [a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] (dog|cat)$/
# regex = /\A(A|The) [a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] (dog|cat)\z/
strings = ["A grey cat", "The lazy dog", "The white cat", "A loud dog",
           "Go away dog", "The ugly rat", "The lazy loud dog"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end