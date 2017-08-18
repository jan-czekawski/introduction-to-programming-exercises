module MyMod
end

p MyMod.class

# module MyOtherModule < MyMod # error
# end

class X < Module
end

p X.class
p X.superclass
p "NeXT"
p Class.superclass
p Module.superclass
p Object.superclass
p BasicObject.superclass
# p nil.superclass