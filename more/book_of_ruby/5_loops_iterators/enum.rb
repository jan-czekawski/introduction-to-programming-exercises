x = (1..5).collect { |i| i }
p x

arr = [1, 2, 3, 4, 5]
p y = arr.map { |i| i }
p z = arr.collect { |i| i * i }

p arr.include?(6)
p arr.include?(3)
p arr.min
p arr.max
p arr.minmax

p "HASH"
p h = { one: "for sorrow", two: "for joy", three: "for a girl", four: "for a boy"}
p m = h.map { |i| i }
p h.min
p h.max
p m.min
p m.max

p h
p h.sort
p h.sort { |a, b| a.to_s <=> b.to_s }

p "MIN"
p h.min
p h.min { |a, b| a[1].length <=> b[1].length }
p h.min { |a, b| a[0].length <=> b[0].length }
p h.min { |a, b| a.length <=> b.length }

p "MAX"
p h.max
p h.max { |a, b| a[1].length <=> b[1].length }
p h.max { |a, b| a[0].length <=> b[0].length }
p h.max { |a, b| a.length <=> b.length }


hash = { a: 10, b: 20, c: 30, d: 40 }
hash.each do |a, b|
  p "a0": a[0], "a1": a[1], "b0": b[0], "b1": b[1] 
end

hash = { az: 10, bx: 20, cy: 30, dw: 40 }
hash.each do |a, b|
  p "a0": a[0], "a1": a[1], "b0": b[0], "b1": b[1] 
end

a = 1
p a[0], a[1], a[2], a[3]
p "%b" % a


a = 5
p a[0], a[1], a[2], a[3]
p "%b" % a


a = 101
p a[0], a[1], a[2], a[3]
p "%b" % a

p str_arr = %i(one two three four)

p h.min { |a, b| str_arr.index(a[0]) <=> str_arr.index(b[0]) }
p h.max { |a, b| str_arr.index(a[0]) <=> str_arr.index(b[0]) }
p h.sort { |a, b| str_arr.index(a[0]) <=> str_arr.index(b[0]) }

p str_arr.push(:five)
p h[:five] = "for a secret never to be told"
p h.sort
p h.sort { |a, b| str_arr.index(a[0]) <=> str_arr.index(b[0]) }