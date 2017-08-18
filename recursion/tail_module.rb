require "method_source"

module TailCallOptimization
  def tail_recursive(name)
    fn = instance_method(name)

  
    RubyVM::InstructionSequence.compile_option = {
      tailcall_optimization: true,
      trace_instruction: false
    }
    
    RubyVM::InstructionSequence.new(<<-EOS).eval
      class #{to_s}
        #{fn.source}
      end
    EOS
  end
end


class Calculator
  extend TailCallOptimization
  
  # tail_recursive def fact(n)
  tail_recursive def fact(n)
    return acc if n <= 1
    fact(n - 1, n * acc)
  end
end