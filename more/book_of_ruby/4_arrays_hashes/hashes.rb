h1 = { b: 10, c: 20, d: 30}
h2 = h1
p h1, h2

h2[:e] = 40
p h1, h2

p "create clone"
h3 = h1.clone
p h1, h2, h3

p "clone changed"
h3[:f] = 50
p h1, h2, h3

p "assume that hashes are not ordered"
h3[:a] = 100
p h3
p h4 = { b: 100, c: 300, a: 700, e: 400, d: 100}