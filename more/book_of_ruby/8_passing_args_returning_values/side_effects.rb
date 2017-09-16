def string_process(str, another_str)
  str.capitalize!
  another_str.reverse!.capitalize!
  str = str + " " + another_str.reverse!
  return str
end

str1 = "hello"
str2 = "world"
str3 = string_process(str1, str2)

p "#{str3}"

# impatient programmer uses modified arguments
p "#{str1} #{str2}"


# original interpretation of method was inefficient or inelegant and decides to change it
def string_process(str, another_str)
  my_str = str.capitalize!
  another_str.reverse!.capitalize!
  my_str = my_str + " " + another_str.reverse
  return my_str
end

str1 = "hello"
str2 = "world"
str3 = string_process(str1, str2)

p "ANOTHER WAY"
p "#{str3}"
p "#{str1} #{str2}"