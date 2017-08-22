multi_arr = [ ["one", "two", "three", "four"],
              [1,     2,     3,       4],
              [:a,    :b,    :c,      :d] ]
              
              
multi_arr = [ ["one", "two", "three", "four"],
              [1,     2,     3,       4],
              [:a,    :b,    :c,      :d],
              [1.1,   2.2,   3.3,     4.4 ] ]

p "first try".upcase           
multi_arr[0].length.times do |i|
  puts multi_arr[0][i], multi_arr[1][i]
end

p "second try".upcase
multi_arr.each do |arr|
  multi_arr[0].length.times do |i|
    puts arr[i]
  end
end

p "THIRD TRY"
multi_arr[0].length.times do |i|
  multi_arr.each do |arr|
    puts arr[i]
  end
end