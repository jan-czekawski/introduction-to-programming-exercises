x = "in top level"
block = Proc.new { puts x }

# x = "home"

def meth(block_arg)
  p "going into first method"
  x = "in first method"
  block_arg.call
  other_bloc = Proc.new { puts x }
  other_bloc.call
  
  def second_meth(arg, arg2)
    p "going into second method"
    x = "in second method"
    arg.call
    arg2.call
    p "leaving second method"
  end

  second_meth(block_arg, other_bloc)
  p "leaving first method"
end

puts x
block.call
meth(block)
block.call
puts x
