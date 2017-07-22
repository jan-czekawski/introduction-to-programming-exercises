# p arr = Array.new(3)
# p arr = Array.new(3, "boss")
# p arr[0].object_id
# p arr[1].object_id
# p arr[2].object_id
# arr << "boss"
# p arr[3].object_id

# def change(*boss)
#   puts boss
#   puts *boss
#   p boss
#   p *boss
# end

# change([1, 2, 3, 4])
# change(1, 2, 3, 4)

# p arr = Array.new(10) { |i| i.to_s }
# p arr = Array.new(5) { Hash.new() }
# p empty_array = Array.new(3) { Array.new(4) }
# p arr = Array({:a => "12"})

# arr = [1, 2, 3, 4, 5, 6, 7, 8]
# p arr[2]
# p arr[1, 3]
# p arr[1..5]
# p arr[1...5]

# # using at
# p arr.at(-2)
# p arr.at(2)
# # raising errors
# p arr.fetch(100, "Doesn't exist")

# p arr.first(3)
# p arr.last(3)


# p arr.take(3)
# p arr.drop(3)


# browsers = ["Chrome", "Firefox", "Safari", "Opera"]
# p browsers.count, browsers.length

# p browsers.empty?, browsers.include?("Boss")

arr = [1, 2, 3, 4]
p arr.push(5)
p arr << 6
p arr.unshift(0)
p arr.insert(3, "boss", "bossanova", "bolbolbol")

arr = [1, 2, 3, 4, 5, 6]
p arr.pop
p arr.shift
p arr.delete_at(2)
p arr.delete(2)
p arr

arr = [1, nil, 2, nil, 3, nil, 4]
p arr.compact
p arr
p arr.compact!

arr = [1, 1, 1, 2, 3, 4, 5]
p arr.uniq
p arr
p arr.uniq!


arr = [1, 2, 3, 4, 5]
arr.each { |i| p i -= 10 }
p arr
words = %w[first second third fourth fifth sixth]
str = ""
words.reverse_each { |word| str += "#{word} " }
p str

p arr.map { |x| 2 * x }
p arr
p arr.map! { |x| x**2 }
p arr

p arr.select { |num| num < 9 }
p arr

p arr.select! { |num| num < 20 }
p arr

p arr.reject { |num| num > 10 }
p arr
p arr.reject! { |num| num > 10 }
p arr

p arr.drop_while { |num| num < 3 }
p arr

arr = [1, 2, 3, 4, 5]
# p arr.delete_if { |a| a == 4 }
p arr.reject! { |a| a == 4}
p arr

p arr.keep_if { |i| i < 3 }
# p arr.select! { |i| i < 3 }
p arr

p arr = Array.[](1, 2, 3)
p arr = Array[1, 2, 3]
p arr = [1, 2, 3]
p "NEXT"

first = [1, 2, 3]
second = Array.new(first)
p first, second, first == second, first.equal?(second)

first = ["bobby", "jerry"]
second = Array.new(first)
p first, second, first == second, first.equal?(second)