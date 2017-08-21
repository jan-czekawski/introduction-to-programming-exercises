a = /(.)(.)(.)/.match("abc")
p a[0], a[1], a[2], a[3], a[4]

p $~[0]

begin
  p $~.sort
rescue => e
  p e
  p e.backtrace
end

p $~.to_a.sort
p $~.captures.sort
