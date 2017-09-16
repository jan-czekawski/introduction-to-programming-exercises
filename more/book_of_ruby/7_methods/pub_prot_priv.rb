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
      self.prot
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
# myob.priv # => error (can't have any receivers, also not the same scope)
# myob.prot # => error (myob is not in the same scope as defined method)

begin
  myob.use_ob(myob2) # => protected is good
rescue => e
  p e
end

