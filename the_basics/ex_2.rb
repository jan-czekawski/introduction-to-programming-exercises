num = 9124

thousand_dig = num / 1000
num %= 1000
hundred_dig = num / 100
num %= 100
ten_dig = num / 10
num %= 10
one_dig = num

puts thousand_dig, hundred_dig, ten_dig, one_dig