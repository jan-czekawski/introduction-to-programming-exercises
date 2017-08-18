def hidden(str, another_str)
  another_str = str + " " + another_str
  another_str.reverse
end

str1 = "dlrow"
str2 = "olleh"
p str3 = hidden(str1, str2)
p str1, str2