class X
  private
  
  def priv(str)
    puts "I'm private, " << str
  end 
end

ob = X.new
# ob.priv("hello") # => private => error
ob.send(:priv, "hello") # => bypass => works

