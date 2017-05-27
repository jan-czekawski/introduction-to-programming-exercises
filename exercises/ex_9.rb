h = { a: 1, b: 2, c: 3, d: 4 }

# 1. get the value of key `:b`
h[:b]

# 2. add to this hash the key:value pair `{ e: 5}`
h[:e] = 5

# 3. remove all key:value pairs whose value is less than 3.5
h.each do |k, v|
  h.delete(k) if v < 3.5
end
