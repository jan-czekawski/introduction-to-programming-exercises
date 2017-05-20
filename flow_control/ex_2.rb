def shout(text)
  return text.upcase if text.length > 10
  text
end

puts shout("Hello!")
puts shout("How do you do, Sir?")