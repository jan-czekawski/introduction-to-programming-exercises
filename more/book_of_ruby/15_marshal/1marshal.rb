f = File.open("friends.sav", "w")
Marshal.dump(["fred", "bart", "mary"], f)
f.close

File.open("more_friends.sav", "w") do |friends_file|
  Marshal.dump(["sally", "agnes", "john"], friends_file)
end

File.open("more_friends.sav") do |f|
  $arr = Marshal.load(f)
end

my_friends = Marshal.load(File.open("friends.sav"))
more_friends = Marshal.load(File.open("more_friends.sav"))

p my_friends, more_friends, $arr

