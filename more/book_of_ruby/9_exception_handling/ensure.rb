p start_dir = Dir.getwd

begin
  Dir.chdir("X:\\")
  puts `dir`
rescue => e
  puts e.class
  puts e
ensure
  Dir.chdir(start_dir)
end


