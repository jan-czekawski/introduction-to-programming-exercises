class MyArray < Array
  include Comparable
  
  def <=>(next_arr)
    self.length <=> next_arr.length
  end
  
  def ==(next_arr)
    "IMPOSIBURU"
  end
end

my_arr = MyArray.new([10, 20, 30, 40])
my_arr2 = MyArray.new([10, 30, 30])
my_arr3 = MyArray.new([1, 1, 1, 1, 1, 1, 1, 1])
my_arr4 = MyArray.new([10, 10, 10, 10, 1, 1, 1, 1])

p my_arr <=> my_arr2
p my_arr <=> my_arr3
p my_arr4 <=> my_arr3

p arr4 = Array.new(my_arr4)
p arr3 = Array.new(my_arr3)

p arr4 <=> arr3

p my_arr4.class, arr4.class 

p my_arr > my_arr4
p my_arr4 === my_arr4
p my_arr4 == my_arr4

