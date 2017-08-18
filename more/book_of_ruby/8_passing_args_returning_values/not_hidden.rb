def not_hidden(str, second_str)
  second_str = str << " " << second_str
  second_str.reverse
end

str1 = "dlrow"
str2 = "olleh"
str3 = not_hidden(str1, str2)
p str1, str2, str3