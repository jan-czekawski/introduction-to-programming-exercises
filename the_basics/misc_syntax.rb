if 10 * 100 == 100 * 10 || 200 /
  20 == 10
  puts "no neeed to be scared"
end

arr = [10, 20, 30 + 100, 20 * 20, 100 % 
       4, 11, 20 == 11]
p arr

def my_method(a, b, c: 20, d: 30,
              e: 40, f: 50)
  p a, b, c, d, e, f
end

my_method(10, 20, f: 100, d: 20, c: 1, e: 999)

# indentation
def my_method(a, b, c)
p a, b, c
if a > 20
if b > 30
else
if c > 100
end
end
end
end

# alias
alias good_method my_method

good_method(10, 20, 30)

$old = 100
alias $new $old
p $new


# undef

# undef good_method
undef :my_method, good_method

begin
  good_method(10, 20, 30)
rescue => e
  puts e
end

begin
  my_method(20, 30, 10)
rescue => e
  # puts e
  warn(e.message)
end

def my_method(c: 20)
  p c: c
end

my_method(c: 99)

# defined?
p defined?(1 + 1)
p defined?(my_method)
p defined?(:my_method)
p defined?(my_method(c: 100))
p defined?(TRUE)
p defined?(true)
p defined?(zz)
p defined?("home")
p defined?(unknown_method)
p defined?(:unknown_method)

p defined?(@instance_var) && @instance_var.zero?
@instance_var = 10
p defined?(@instance_var) && @instance_var.zero?

p instance_variable_defined?(:@instance_var)

p Object.const_defined?(:RUBY_VERSION)
p Object.const_defined?("RUBY_VERSION")
p Object.const_defined?(:RUBY_VERSIONS)

# BEGIN/END
BEGIN {
  puts "begin at the top"
}

END {
  puts "at the end"
}

p "maybe not at the end"

def my_method(a)
  # BEGIN {                   # => error
  #   puts "at the begining"
  # }
  END {
    puts "no error only warning"
  }
end

# ruby -ne 'BEGIN { count = 0 }; END { puts count }; count += gets.to_i'