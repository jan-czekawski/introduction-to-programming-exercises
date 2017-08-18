def change(x)
  x += 1
  return x
end

a = 10
p "a before the change = #{a}"
p "value return by method change(a) = #{change(a)}"
p "a after the change = #{a}"

num = 20
p "num.object_id=#{num.object_id}"
num = change(num)
p "num.object_id=#{num.object_id}"
p 20.object_id
p 21.object_id

