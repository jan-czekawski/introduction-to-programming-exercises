# p /(hi).*(h...o)/ =~ "The word 'hi' is the short for 'hello'"
# p $1, $2

# p /(\S)/ =~ "The word 'hi' is the short for 'hello'"
# p $1, $2


# p /(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)/ =~ "The word 'hi' is the short for 'hello'"

# 36.times do |num|
#   p "$#{num} = #{eval("$#{num}")}"
# end

/(hi).*(h...o)/ =~ "The word 'hi' is the short for 'hello'"
print $1, " ", $2, "\n"

/(.)(.)(.)/ =~ "abcdef"
print $1, " ", $3, "\n"
