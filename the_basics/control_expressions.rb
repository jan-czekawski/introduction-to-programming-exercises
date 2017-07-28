if true then
  puts "The test resulted in true-value"
end

if false
  puts "eval to true"
else
  puts "eval to false"
end

a = 1
if a == 0
  puts "a is 0"
elsif a == 1
  puts "a is 1"
else
  puts "a is other value"
end

if a == 0
  puts "a 0"
elsif a == 1
  puts "a 1"
elsif a >= 1
  puts "a bigger equal 1"
else
  puts "a other"
end

if a = 10
  puts "evals true"
  p a
else
  puts "evals false"
  p a
end

p a

getter = "HellO"

input_type = getter =~ /hello/i ? "greeting" : "hello"
p input_type

getter = "boss"
input_type = if getter =~ /hello/i
              "greeting"
             else
               "hello"
             end
             
p input_type

unless true
  puts "evals to false"
end

if not true then
  puts "evals to false"
end


# if/unless modifiers
a = 0
a += 1 if a.zero?
p a

a = 0
a += 1 unless a.zero?
p a

# p b if b = 0.zero? # => raises name error => different parse order
if b = 0.zero?
  p b
end

# case expressions
case "12345"
when /^1/
  p "string starts with one"
else
  p "string DOESN'T start with one"
end

p /^1/ == "12345"

case "2"
when /^1/, "2"
  puts "one or two"
end

a = 11

case a
when 1, 2 then puts "one or two"
when 3    then puts "three"
else           puts "other value"
end

# while loop
a = 1
while a < 10 # do => optional
  p a
  a += 1
end

# returns nil, unless break provides value
a = 1
c = while a < 10 # do => optional
      p a
      a += 1
      break "rubbish" if a == 10
    end
p c

# until loop
a = 10
until a <= 0 # do => optional
  p a
  a -= 1
end

p "#" * 100


# for loop
for value in [1, 2, 3] # do
  p value
end

c = for value in [2, 4, 6, 10]
      p value
    end
p c

c = for value in [2, 4, 6, 10]
      p value
      break "different" if value == 10
    end
p c

# while/until modifiers
a = 0
a += 1 while a < 10
p a

a = 0
a += 1 until a > 10
p a

# do/while loop
a = 0
begin
  a += 1
  p a
end while a < 10

# break statement
values = 1, 2, 3

c = values.each do |value|
      p value
      # break value * 100 if value.even?
    end
p c

result = [1, 2, 3].each do |value|
           break value * 2 if value.even?
         end

p result