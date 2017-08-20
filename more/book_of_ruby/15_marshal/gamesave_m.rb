my_map = ["Some map with many objects", ["swords", "shields"], ["coins", "exp"]]

File.open("game.sav", "w") do |f|
  Marshal.dump(my_map, f)
end

File.open("game.sav") do |f|
  my_map = Marshal.load(f)
end

