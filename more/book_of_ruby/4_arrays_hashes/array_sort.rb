arr = [10, 20, 30, 40]
arr2 = [10, 30, 30]

p arr <=> arr2

arr2 = [10, 20, 30, nil]

p arr <=> arr2

p sorted_array = arr2.sort { |a, b| a.to_s <=> b.to_s }
p reverse_sorted_array = arr2.sort { |a, b| b.to_s <=> a.to_s }