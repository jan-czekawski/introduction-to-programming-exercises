def calc_tax(tax_rate)
  # return proc { |subtotal| subtotal * tax_rate }
  return lambda { |subtotal| subtotal * tax_rate }
end

p sales_tax = calc_tax(0.10)
p vat = calc_tax(0.175)

print "Tax due on book = "
print sales_tax.call(10)
# print sales_tax.call(10, 30, 100) # => error if lambda, ok if proc

print "\nVat due on DVD = "
print vat.call(10)
print "\n"