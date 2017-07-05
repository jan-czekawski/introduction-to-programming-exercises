# Test the pattern /\s...\s/ from the previous exercise against this
# text (be sure to delete the previous text first):

# Doc in a big red box.
# Hup! 2 3 4

# Observe that only one of the 3 letter words in this text match 
# the pattern, and it also matches "2 3". Why is it 
# that this pattern doesn't include the 3 letter words Doc, red, 
# box, or Hup, but it does match 2 3?


# In the first string only "big" and "red" have whitespaces delimiting them,
# but after pattern matches "big" (with spaces before and after the string)
# it can't matched with "red" (cause there's no available whitespace before "red", only after)

# In the second string only "2 3" has whitespaces on both sides and space
# inside of "2 3" matches any (/./) sign => there are 3 signs
# (2, whitespace and 3) with whitespaces on both sides

regex = /\s...\s/
strings = ["Doc in the big red box", "Hup! 2 3 4"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end