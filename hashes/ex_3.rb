movies = { rocky: "drama", rambo: "action", shawshank_redemption: "drama", twelve_angry_men: "drama" }

puts "Here's a list of movie titles:"
movies.each_key do |title|
  puts title
end
puts "And here's a list of their genre:"
movies.each_value do |genre|
  puts genre
end
puts "You can always look at them combined:"
movies.each do |title, genre|
  puts "Title: #{title}, genre: #{genre}"
end