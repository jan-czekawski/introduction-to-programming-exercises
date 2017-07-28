# integers
p 1234 == 1_234
p 12_34 == 1_234
p 123_4 == 1_234

# floats
p 12.34 == 1234e-2
p 12.34 == 1.234E1
p 1_2.34 == 1.234E1
p 12.34 == 1.23_4E1
# p 12.34 == 1.234_E1 # => error
# p 12._34 == 1.234E1 # => error
# p 12_.34 == 1.234E1 # => error

p 0d170, 0D170
p 0xaa, 0XaA
p 0252, 0o252, 0O252
# p 0252 == 0_o252 # error
p 0252 == 0o25_2
p 0b10101010 == 0b1010_1010 


# strings
p "this is string"
p "this is \"escaped\" string"
p 'this is "escaped" string'
puts 'this is "escaped" string'
p 'this is \"escaped\" string'