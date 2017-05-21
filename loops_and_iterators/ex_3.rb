fav_fruit = ["grapefruit", "raspberry", "strawberry", "apple", "watermelon"]

fav_fruit.each_with_index do |fruit, idx|
  puts "One of my favourie fruit is #{fruit}. It's number #{idx + 1} on my top 5 list!"
end