puts /.+\\/.match("C:\\mydirectory\\myfolder\\myfile.txt")
puts /.+\\/.match('C:\mydirectory\myfolder\myfile.txt')

puts /.+?\\/.match('C:\mydirectory\myfolder\myfile.txt')