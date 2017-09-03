class X
  def add_method(m, &block)
    self.class.send(:define_method, m, &block)
  end
end

ob = X.new

X.freeze
# if !(X.frozen?)
  ob.add_method(:def) { puts "'def' is not a good name for a method" }
# end

ob.def