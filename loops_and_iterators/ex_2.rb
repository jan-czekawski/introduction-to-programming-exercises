input = ""

while input != "STOP" do
  puts "Hello! What word should I print on your screen?"
  input = gets.chomp
  puts "You've asked for word #{input}!"
end