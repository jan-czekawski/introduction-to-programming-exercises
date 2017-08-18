def foo(b)
  puts "---in foo---"
  a = 'foo'
  if block_given?
    puts "block passed to foo"
    yield(a)
  else
    puts "no block passed to foo"
  end
  puts "in foo, arg b = #{b}"
  return "returned by " << a
end

def bar
  puts "---in bar---"
  a = 'bar'
  if block_given?
    puts "block passed to bar"
    yield(a)
  else
    puts "no block passed to bar"
  end
  return "returned by " << a
end

p "do/end"
foo bar do |s|
  puts s
end
p "{}"
foo bar { |s| puts s }