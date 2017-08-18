class X
  def not_hidden(str, second_str)
    second_str = str << " " << second_str
    second_str.reverse
  end
end

ob = X.new

str1 = "dlrow"
str2 = "olleh"
p str3 = ob.not_hidden(str1, str2)
p str1