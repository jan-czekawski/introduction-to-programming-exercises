str = Marshal.dump("thing")
p RUBY_VERSION
p str[0].ord
p str[1].ord

x = Marshal.dump("hello world")
puts "Marshal version: #{x[0].ord}:#{x[1].ord}"
p Marshal::MAJOR_VERSION, Marshal::MINOR_VERSION

