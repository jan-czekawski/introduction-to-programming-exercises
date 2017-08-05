begin
  # code that might raise
rescue
  # handle exceptions
end

def my_method
  # 
rescue
  # 
end

begin
a = Array.new(2)
a[0] + a[1]
rescue => except
  warn(except.message)
  # raise
end
a[0] = 10 if a[0].nil?
p a[0]
p except
p except.message

begin
  # 
rescue ArgumentError, NameError
  # handle argument or name error
end

begin
  # 
rescue ArgumentError
  # handle argument error
rescue NameError
  # handle name error
rescue
  # handle any StandardError
end

begin
  # 
rescue
  # do sth that may change result of the begin block
  retry # => might create infinite loop
end

begin
  # 
rescue
  # 
ensure
  puts "regardless of exceptions"
end

begin
  # 
rescue
  # 
else
  puts "no exceptions"
ensure
  puts "regardless of exceptions"
end

boss = NoMethodError.new("undefined method for #{self}")

begin
  raise(boss)
# rescue ArgumentError
rescue NoMethodError => exc
  p "exception is rescued"
end

p exc