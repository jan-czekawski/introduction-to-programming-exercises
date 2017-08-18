class MyArray < Array
  def initialize(arr)
    super(arr)
  end
  
  def times_repeat(number)
    number.times do |num|
      self.each do |item|
        yield("[#{num}] :: '#{item}'")
      end
    end
  end
end

new_arr = MyArray.new([1, 2, 3])
p new_arr
p new_arr.class
new_arr.times_repeat(3) { |x| puts x }
new_arr.times_repeat(2) { |x| puts x }
new_arr.times_repeat(1) { |x| puts x }
