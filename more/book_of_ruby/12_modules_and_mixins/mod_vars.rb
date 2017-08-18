x = 1       # local to this program

module Foo
  x = 50    # local to module Foo
            
            # this can be mixed in but var x won't be visible

  def no_bar
    x
  end
  
  def bar
    @x = 1000
    @x
  end
  
  puts "In Foo: x = #{x}" # this can access the module-local x => it's from inside the module
end

include Foo               # mix in the Foo module

puts "x = #{x}"
# puts no_bar # error
puts bar
