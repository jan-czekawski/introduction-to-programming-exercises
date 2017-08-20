class MyClass
  private
    def priv
      puts "private"
    end
    
  protected
    def prot
      puts "protected"
    end
    
  public
    def pub
      puts "public"
    end
    
    def use_ob(ob)
      ob.pub
      ob.prot
      prot
      p "private without any receiver:"
      priv
      # self.priv # => not even self
      p "but private with receiver aaaaand"
      ob.priv
    end
end

# both are instances of the same class
myob = MyClass.new
myob2 = MyClass.new

myob.pub
# myob.priv # => error
# myob.prot # => error

begin
  myob.use_ob(myob2) # => protected is good
rescue => e
  p e
end

