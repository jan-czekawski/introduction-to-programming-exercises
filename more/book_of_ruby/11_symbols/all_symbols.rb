p Symbol.all_symbols
p Symbol.all_symbols[0, 10]
p [:a, :c, :b].sort

str_arr = Symbol.all_symbols.map { |s| s.to_s }
p str_arr.sort
p str_arr.sort[0, 10]