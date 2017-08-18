RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

# METHOD DEFINED IN THE SAME FILE CAUSES STACK ERROR 
# def fact(n, acc = 1)
#   return acc if n <= 1
#   fact(n - 1, n * acc)
# end

require "./fact.rb"

p fact(50000)