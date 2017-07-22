=begin
# INTEGERS
str = 123
# binary
puts format("%b", str)
puts sprintf("%b", str)

str = -123
# binary negatives with prefix
puts format("%b", str)
puts format("%B", str)

str = 123.232
# decimal
puts format("%d", str)
puts format("%i", str)
puts format("%u", str)

str = 123
# octal
puts format("%o", str)

# hex
puts format("%x", str)

# FLOATS
str = 1.32
# exponent
puts format("%e", str)
puts format("%.1e", str)
puts format("%.2e", str)
puts format("%.3e", str)
puts format("%.4e", str)

# exp with uppercase
puts format("%.4E", str)

# different precision
puts format("%.4f", str)
puts format("%.1f", str)
puts format("%.100f", str)
puts 1.32 == format("%.100f", str)
puts str == format("%.100f", str)
puts str == 1.32

# exp for small numbers
str = 1.32 / 1_000_000
puts format("%f", str)
puts format("%.10f", str)
puts format("%g", str)
puts format("%.0g", str)
puts format("%.1g", str)

# 0x digits decimal format
puts format("%a", str)
puts format("%.4a", str)
str = 312.123
puts format("%a", str)
puts format("%.4a", str)
puts format("%A", str)
puts format("%.4A", str)

# OTHER
# chars
str = "C"
puts format("%c", str)
str = 1000
puts format("%c", str)
str = 10_000
puts format("%c", str)
str = 10_200
puts format("%c", str)

# inspect
puts format("%p", str)

# substitute
str = 100
puts format("%sabba", str)
puts format("%.1sabba", str)
puts format("%.2sabba", str)

# percent
str = 100
puts format("%%")
puts format("%%", str)


# flags
str = 123
# binary
puts format("% b", str)
puts sprintf("% b", str)

str = -123
# binary negatives with prefix
puts format("% b", str)
puts format("% B", str)

str = -12.12123
puts format("%g", str)
puts format("% g", str)
puts format("% a", str)
puts format("%A", str)


# (digit)$
puts format("%2$A", str, str * 1000)
puts format("%3$e", str, str * 100, str / 100)

str = 13123 * 112341
# alternative format #
puts format("%#e", str) 
puts format("%e", str) 
puts format("%#a", str)
puts format("%a", str)

# + add plus
puts format("%+e", str)
puts format("%o", str)
puts format("%+o", str)
puts format("%x", str)
puts format("%+x", str)

str = -12
puts format("%+e", str)

# width with justify
str = -1212
puts format("%-20e", str)
puts format("%20e", str)
str = 1000
puts format("%20d", str)
puts format("%-20d", str)


# pad with 0
str = 12
puts format("%020d", str)
puts format("%020x", str)
puts format("%020b", str)
str = -12
puts format("%020d", str)
puts format("%020X", str)
puts format("%020B", str)

# use NEXT arg (next after format string) for width
str2 = 30
puts format("%0*d", str2, str)
puts format("%*d", str2, str)

# # forces to show decimal point
puts format("%.0e", 1)
puts format("%#.0e", 1)

puts sprintf("%.0f", 1234)
puts sprintf("%#.0f", 1234)

# also disables stripping lowest zeros
puts format("%g", 123.4)
puts format("%#g", 123.4)
puts format("%g", 123456)
puts format("%#g", 123456)

# width
puts format("%20d", 123)
puts format("%+20d", 123)

# padding with 0
puts format("%020d", 123)
puts format("%+020d", 123)
puts format("% 020d", 123)
p format("%-020d", 123)
p format("%-+20d", 123)
p format("%- 20d", 123)
p format("%020x", -123)

=end
# precision

# min num of digits
p format("%20.8d", 123)
p format("%20.8o", 123)
p format("%-20.8o", 123)
p format("%20.8x", 123)
p format("%20.8b", 123)
p format("%20.8d", -123)
p format("%20.8o", -123)
p format("%20.8x", -123)
p format("%20.8b", -123)

# 0x and 0b are not counted for precision
# but 0 for #o is counted
p format("%#20.8d", 123)
p format("%#20.8o", 123)
p format("%#20.8x", 123)
p format("%#20.8b", 123)
p format("%#20.8d", -123)
p format("%#20.8o", -123)
p format("%#20.8x", -123)
p format("%#20.8b", -11)

# for e precision => num of digs after decimal
p format("%20.8e", 1234.56789)

# for f precision => num of digs after decimal
p format("%20.8f", 1234.56789)

# for g => num of significant digits
p format("%20.8g", 1234.56789)
p format("%-20.8g", 1234.56789)
p format("%20.8g", 123456789)

# for s => max num of chars
p format("%20.8s", "string test")
p format("%20.20s", "string test")


# EXAMPLES
p format("%d %04x", 123, 123)
p format("%08b '%4s'", 123, 123)
p format("%016b '%4s'", 123, 123)
p format("%1$*2$s %2$d %1$s", "hello", 8)
p format("%1$*2$s %2$d", "hello", -8)
p format("%+g:% g:%-g", 1.23, 1.23, 1.23)
p format("%u", -123)

# reference by name => %<name> is used
# but %{name} CANNOT USED
p format("%<foo>d : %<bar>f", { :foo => 1, :bar => 2})
p format("%<foo>d : %<bar>.2f", { :foo => 1, :bar => 2})
p format("%<foo>d : %<bar>e", { :foo => 1, :bar => 2})
# BUT!!!
p format("%{foo}f", { :foo => 1 })





