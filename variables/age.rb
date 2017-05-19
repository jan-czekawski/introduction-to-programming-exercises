puts "How old are you?"
users_age = gets.chomp.to_i

[10, 20, 30, 40].each do |decade|
  puts "In #{decade} years you will be:", users_age + decade
end