direct = `pwd`.chomp
p direct

p File.exist?(direct + "a")
p File.exist?(direct)

if File.exist?("C:\\")
  puts "Yup, you have C drive as directory!"
else
  puts "Nope, can't find C drive..."
end

p File.directory?(direct)
p File.directory?("myfile.txt")
p File.directory?("myfile")
p File.directory?("./myfile.txt")
p File.directory?("./")

def dir_or_file(name)
  if File.directory?(name)
    puts "#{name} is a directory"
  else
    puts "#{name} is a file"
  end
end

