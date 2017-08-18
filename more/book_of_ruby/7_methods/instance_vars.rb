class MyClass
  @@class_var = 1000
  @instance_var = 1000
  
  def self.class_method
    if @instance_var.nil?
      @instance_var = 10
    else
      @instance_var += 10
    end
  end
  
  def instance_method
    if @instance_var.nil?
      @instance_var = 1
    else
      @instance_var += 1
    end
  end
end

ob = MyClass.new
puts MyClass.instance_variable_get(:@instance_var)
puts "-" * 30

3.times do
  # MyClass.class_methods
  ob.instance_method
  puts "MyClass @inst=#{MyClass.instance_variable_get(:@instance_var)}"
  puts "ob @inst=#{ob.instance_variable_get(:@instance_var)}"
end