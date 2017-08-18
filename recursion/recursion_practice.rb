# http://www.blackbytes.info/2015/08/ruby-recursion-and-memoization/

# def iterative_factorial(n)
#   (1..n).inject(:*)
# end

# p iterative_factorial(10)

# def recursive_factorial(n)
#   # base case
#   return 1 if n <= 1
  
#   # recursive call
#   n * recursive_factorial(n-1)
# end

# p recursive_factorial(10)

# # fibonacci
# def fib(n)
#   return n if n < 2
  
#   fib(n-1) + fib(n-2)
# end

# # (1..20).each { |n| puts fib(n) }
# # p fib(40) # => veeeery slow => don't even think about 1000 or more!!!

# # MEMOIZATION
# @cache = [0, 1]

# def fib(n)
#   return @cache[n] if @cache[n]
#   @cache[n] = fib(n-1) + fib(n-2)
# end

# # p fib(9361) # => too much
# # p fib(9360) # => max
# # p fib(18000) # => can have bigger, cause cache exists from the previous call!!
# # p fib(27000) # => even bigger


# def fibonacci_iterative(n)
#   memo = []
  
#   (0..n).each do |i|
#     memo[i] = i < 2 ? i : memo[i-1] + memo[i-2]
#   end
#   memo[n]
# end

# p fibonacci_iterative(100)
# # p fibonacci_iterative(100000)



# # http://ruby.bastardsbook.com/chapters/recursion/

# # make some random rocks
# rocks = 30.times.map { rand(200) + 1 }
# p rocks.join(", ")
# max_rock = 0

# rocks.each do |rock|
#   max_rock = rock if max_rock < rock
# end

# puts "Heaviest rock is: #{max_rock}"

# # with inject
# puts "Heaviest rock is: #{rocks.inject { |max_rock, rock| max_rock > rock ? max_rock : rock} }"

# p "Array rocks before recursion: #{rocks}"

# def rock_judger(rocks_arr)
#   if rocks_arr.length <= 2 # base case
#     a = rocks_arr[0]
#     b = rocks_arr[-1] 
#   else
#     a = rock_judger(rocks_arr.slice!(0, rocks_arr.length / 2))
#     b = rock_judger(rocks_arr)
#   end
#   return a > b ? a : b
# end

# # puts "Heaviest rock is: #{rock_judger(rocks)}"

# p "Array rocks after recursion: #{rocks}"

# # two line version
# def rock_judger(r_arr)
#   count = r_arr.length
#   a, b = count <= 2 ? [r_arr[0], r_arr[-1]] : [rock_judger(r_arr.pop(count/2)), rock_judger(r_arr)]
#   return a > b ? a : b
# end

# puts rock_judger(rocks)


# TAIL RECURSIVE OPTIMIZATION
# http://nithinbekal.com/posts/ruby-tco/


def fact(n)
  return 1 if n <= 1
  n * fact(n-1)
end
# not tail recursive because the last line is operation with the .fact call
# should only be the call to .fact method

def fact(n, acc = 1)
  return acc if n <= 1
  fact(n - 1, n * acc)
end

# RubyVM::InstructionSequence.compile_option = {
#   tailcall_optimization: true,
#   trace_instruction: false
# }

# same difference => try with another file main.rb

p fact(10500)