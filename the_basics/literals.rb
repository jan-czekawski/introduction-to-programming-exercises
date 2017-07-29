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
str = "harr\bboss\tcheck\t\bnope"
puts str
str = "boss\u9999case"
puts str
str = "\u1150"
puts str
str = "bosscoase\c?"
puts str

puts "One plus one is #{1 + 1}"
puts "One plus one is \#{1 + 1}"
puts 'One plus one is \#{1 + 1}'

puts %Q(One plus one is #{1 + 1})
puts %Q[One plus one is #{1 + 1}]
puts %Q{One plus one is #{1 + 1}}

puts %q(One plus one is #{1 + 1})
puts %q[One plus one is #{1 + 1}]
puts %q{One plus one is #{1 + 1}}

p "boss" "check" "home"
# p "check" 'mate' %q(home) # => error q last
# p "carry" "take" %q{carry} 'loss' # => error q not first
# p %Q(home) "carry" "take" %q{carry} 'loss' # => error q not first
# p %q(home boy man) %Q(cannot be too) # => qQ not first error
p %q(home boy but neither) "can't do it" ' but gotta do it'


# character literal notation
p ?a, ?\n, ?\t, ?\u{1500}

result = <<HEREDOC
boss is here but try not to be
bold cause you might try
HEREDOC

p result

result = <<HOME_HEREDOC
who let the dogs out???
HOME_HEREDOC

p result

result = <<-HEREDOC
        who let the dogs out???
        HEREDOC

p result


result = <<~HEREDOC
          who let the dogs out???
  who let the dogs out???
  1 + 1 is #{1 + 1}
        HEREDOC

p result

result = <<~'HEREDOC'
          who let the dogs out???
  who let the dogs out???
  1 + 1 is #{1 + 1}
        HEREDOC

p result

result = <<~`HEREDOC`
cat #{__FILE__}
        HEREDOC

# p result

# call method on heredoc
result = <<HEREDOC.split
  boss check have home
HEREDOC

p result

# symbols
p :"home#{1 + 10}"
p :"home"


# arrays
p arr = [1, 2, 3, 44 * 2, 99 / 11, 10 == 100]

# hashes
p hash = { "a" => 1, "b" => 12 }
p hash = { a: 11, b: 10 }
p hash = { "boss #{10 * 90}": 11}

# ranges
p (1..2), (1...2)

# regexp
p /my pattern#{9 * 10}/i

# procs(and lambdas)
p pr = -> {1 + 1}
p pr.call

p pr = -> (x) {x * 90}
# p pr.call # => arg error
p pr.call(100)

p pr = -> (x) { x }
# p pr.call # => arg error
p pr.call(100)


p pr = proc { |x| x }
p pr.call
p pr.call(100)


# percent strings
p %(home boy just righ #{10 * 90})

# strings
p %Q(home boy just righ #{10 * 90})
p %q(home boy just righ #{10 * 90})

# array of symbols
p %I(home boy just righ #{10 * 90})
p %i(home boy just righ #{10 * 90})

# regexp
p %r(home boy just righ #{10 * 90})

# symbol
p %s(home boy just righ #{10 * 90})

# array of strings
p %W(home boy just righ #{10 * 90})
p %w(home boy just righ #{10 * 90})

# backticks (capture subshell result)
p `date`
p %x(date)

# escape space in array of strings
p %w(home\ check but not later)
p %W(home\ check but not later)

p %W{home\ check but not later}
p %W[home\ check but not later]
p %W<home\ check but not later>
p %W%home\ check but not later%
p %W^home\ check but not later^
p %W!home\ check but not later!
p %W?home\ check but not later?
p %W.home\ check but not later.