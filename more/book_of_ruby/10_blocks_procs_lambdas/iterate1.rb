def times_repeat(num)
  for i in 1..num do
    yield i
  end
end

times_repeat(3) { |i| puts "[#{i}] hello world"}

def times_repeat2(num, arr)
  arr.each { |item| yield(item) }
end

times_repeat2(3, ["hello", "good day", "how do you do"]) { |x| puts x }