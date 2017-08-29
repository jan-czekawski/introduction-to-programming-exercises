def method_missing(method_name, *args)
  puts "Class #{self.class} does not understand: #{method_name}(#{args.inspect})"
end

xxx
xxx("a", "b", 11)