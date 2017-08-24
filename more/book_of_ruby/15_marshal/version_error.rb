f = File.open("friends.sav", "w")
x = Marshal.dump(["fred", "bertie", "mary jane"], f)
f.close

begin
  p x[0].ord, x[1].ord
rescue => e
  p e
end

File.open("friends.sav") do |f|
  x = Marshal.load(f)
end

p x

p x[0], x[0].ord, x[1], x[1].ord