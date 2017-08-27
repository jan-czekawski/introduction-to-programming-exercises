def get_binding(str)
# def get_binding(str2)
  binding
end

str = "hello"
puts eval("str + ' Fred'")
puts eval("str + ' Fred'", get_binding("bye"))
# puts eval("str2 + ' Fred'", get_binding("bye"))
