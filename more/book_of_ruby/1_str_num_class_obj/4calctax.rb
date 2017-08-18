# tax_rate = 0.175
# print "Enter price (ex tax): "
# s = gets
# sub_total = s.to_f
# tax = sub_total * tax_rate
# puts "Tax on $#{sub_total} is $#{tax}, so grand total is $#{sub_total + tax}"

# if/then
tax_rate = 0.175
print "Enter price (ex tax): "
s = gets
sub_total = s.to_f

if sub_total < 0.0 then
  sub_total = 0.0
end

tax = sub_total * tax_rate
puts "Tax on $#{sub_total} is $#{tax}, so grand total is $#{sub_total + tax}"