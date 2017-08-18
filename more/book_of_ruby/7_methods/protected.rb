class MyClass
  private
    def priv(str)
      str.upcase
    end
    
  protected
    def prot(str)
      str << "!!!!!!!!"
    end
    
  public
    def exclaim(ob) # => calls protected method
      puts ob.prot("This is a #{ob.class} - hurrah")
    end
    
    def shout(ob) # => calls private method
      puts ob.priv("This is a #{ob.class} - hurrah")
    end
end

class MyOtherClass < MyClass
end

class MyUnrelatedClass
end

my_ob = MyClass.new
my_other_ob = MyOtherClass.new
my_unrelated_ob = MyUnrelatedClass.new

# my_ob.shout(my_other_ob) # private => error
# my_other_ob.shout(my_ob) # private => error 
# (even passing ancestor my_ob as argument and invoking method shout on the descendant
# my_other_ob doesn't work) 
                           
                           
my_ob.exclaim(my_other_ob) # => protected => ok
my_other_ob.exclaim(my_ob) # => protected => ok
my_other_ob.exclaim(my_other_ob) # => protected => ok

# my_ob.exclaim(my_unrelated_ob) # => protected, but it's not obj of class/subclass => error


