x = "hello world"

block = Proc.new { puts x }

def meth(block_arg)
  x = "goodbye"
  block_arg.call
end

puts x
block.call
meth(block)
block.call
puts x