input = ""
until input == "q"
  input = gets.chomp
  eval(input) if input != "q"
end