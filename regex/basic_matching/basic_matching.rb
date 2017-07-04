str = "cast"
p "matched 's'" if str.match(/s/)
p "matched 'x'" if str.match(/x/)

str = "Doc?"
p "matched '?'" if str.match(/\?/)

str = "D oc:."
p "matched ':'" if str.match(/:/)
p "matched ' '" if str.match(/ /)
p "matched '.'" if str.match(/\./)

str = "copytcat"
p "matched 'cat'" if str.match(/cat/)

str = "cat mauled my dog"
p "matched 'cat' or 'dog'" if str.match(/(cat|dog)/)

str = "(cat|dog)"
p "matched '(cat|dog)'" if str.match(/\(cat\|dog\)/)

str = "bob\tcan"
puts str
puts "matched '\\t' => has tab" if str.match(/\t/)

str = "LAunch"
puts "matched launch case-insensitive" if str.match(/launch/i)