puts "Hello! Please type in your first name:"
first_name = gets.chomp
puts "And could you please type in your last name:"
last_name = gets.chomp

name = "#{first_name} #{last_name}"

puts "Hi, #{name}! It's so nice to meet you!!"

10.times do
  puts name
end

