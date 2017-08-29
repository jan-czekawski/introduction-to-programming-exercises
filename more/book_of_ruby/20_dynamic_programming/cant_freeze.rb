class X 
  def add_method(m, &block)
    self.class.send(:define_method, m, &block)
  end
end

ob = X.new
ob.freeze
# ob.abc # error
ob.add_method(:abc) { puts "This is abc method" }
ob.abc


class Subarray < Array
  def add_method(m, &block)
    self.class.send(:define_method, m, &block)
  end
end

ob2 = Subarray.new
p ob2
ob2.freeze
ob2.add_method(:boss) { self[0] = 10 }

begin
  ob2.boss  
rescue => e
  p e
end

p ob2