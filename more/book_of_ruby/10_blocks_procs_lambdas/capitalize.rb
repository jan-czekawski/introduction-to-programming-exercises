a = "hello world"
new_str = ""
p new_str, a
a = "hello world".split(//).each { |x| new_str << x.capitalize }
# a = "hello world".split(//).each { |x| new_str << x.capitalize! } # => error cause capitalize! might return nil
p new_str, a

"hello".each_byte do |i|
  p i.chr
end

