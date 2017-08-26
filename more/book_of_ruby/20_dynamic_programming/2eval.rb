print "Enter a string method name (e.g. reverse and upcase):"
                                    # user enters upcase
method_name = gets.chomp
exp2 = "'Hello world'." << method_name
puts eval(exp2)
puts "#{exp2}"
puts "#{eval(exp2)}"