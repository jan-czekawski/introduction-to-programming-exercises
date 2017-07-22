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
# puts format("%+e", str)
