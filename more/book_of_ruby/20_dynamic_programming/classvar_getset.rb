class X
  def self.add_var(symbol, value)
    class_variable_set(symbol, value)
  end
  
  def self.get_var(symbol)
    class_variable_get(symbol)
  end
end

p X.class_variables

X.add_var(:@@new_var, 2000)
p X.get_var(:@@new_var)

p X.class_variables