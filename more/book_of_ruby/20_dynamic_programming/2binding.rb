def get_binding
  str = "bye"
  # str2 = "bye"
  binding
end

str = "hello"
puts eval("str + ' Fred'")
puts eval("str + ' Fred'", get_binding)
# puts eval("str2 + ' Fred'", get_binding)
puts eval("str + ' Fred'")