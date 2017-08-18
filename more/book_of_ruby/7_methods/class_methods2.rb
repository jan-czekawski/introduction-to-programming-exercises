class MyClass
  @@class_var = 1000
  @instance_var = 1000
  
  def self.class_method
    if @instance_var.nil?
      @instance_var = 10
    else
      @instance_var += 10
    end
    
    if @@class_var.nil?
      @@class_var = 10
    else
      @@class_var += 10
    end
  end
  
  def instance_method
    if @instance_var.nil?
      @instance_var = 1
    else
      @instance_var += 1
    end
    
    if @@class_var.nil?
      @@class_var = 1
    else
      @@class_var += 1
    end
  end

  def show_vars
    "(instance method) @instance_var=#{@instance_var}, @@class_var=#{@@class_var}"
  end
  
  def self.show_vars
    "(class method) @instance_var=#{@instance_var}, @@class_var=#{@@class_var}"
  end
end

# @instance_var of the class is not the same as @instance_var of the new object(of that class)

3.times do
  ob = MyClass.new
  MyClass.class_method
  ob.instance_method
  puts MyClass.show_vars
  puts ob.show_vars
end
