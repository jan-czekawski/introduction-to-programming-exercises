a = ["white snow", "winter wonderland", "melting ice", "slippery sidewalk", "salted roads", "white trees"]

a.map! do |long_word|
  long_word.split(" ")
end

a.flatten!
p a