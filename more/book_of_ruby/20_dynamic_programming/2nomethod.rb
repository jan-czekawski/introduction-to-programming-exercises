class X
end

def method_missing(method_name, *args)
  puts "Class #{self.class} does not understand: #{method_name}(#{args.inspect})"
end

xxx
xxx("a", "b", 11)

ob = X.new
ob.aaa
ob.aaa(1, 2, 3)

def method_missing(method_name, *args)
  self.class.send(:define_method, method_name, ->(*args) {puts args.inspect} )
end

ob.aaa
ob.aaa(10, 20, 30)
ob.bbb
ob.bbb("home", "boy")