clos = lambda { @hello << "yikes!" }



def func(closure)
  @hello = "hello world"
  # @hello ||= "hello world"
  closure.call
end

p @hello
func(clos)
p @hello
func(clos)
p @hello
func(clos)
p @hello

# clos.call
# p @hello


clos = lambda do
  @hello << "yikes!"
  puts "in #{self} object of class #{self.class}, @hello = #{@hello}"
end

class X
  def y(b)
    @hello = "I say, I say, I say!!!"
    puts "  [In X.y]"
    puts "in #{self} object of class #{self.class}, @hello = #{@hello}"
    puts "   [In X.y] when block is called..."
    b.call
  end
end

x = X.new
x.y(clos)