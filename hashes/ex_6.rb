words = ["demo", "none", "tied", "evil", "dome", "mode", "live",
         "fowl", "veil", "wolf", "diet", "vile", "edit", "tide",
         "flow", "neon"]
         
annagrams = Array.new

i = 0
j = 1

while i < words.length
  if i + 1 != j
    j = i + 1
  end
  sub_array = Array.new
  until words[j].nil?
    is_annagram = true
    k = 0
    until words[i][k].nil?
      is_annagram = false unless words[j].include?(words[i][k])
      break unless words[j].include?(words[i][k])
      k += 1
    end
    sub_array << words[j] if is_annagram
    j += 1
  end
  sub_array << words[i]
  is_unique = true
  sub_array.each do |element|
    is_unique = false if annagrams.flatten.include?(element)
  end
  annagrams << sub_array if is_unique
  i += 1
end

annagrams.each do |result|
  p result
end