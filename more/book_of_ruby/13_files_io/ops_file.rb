direct = Dir.getwd
p direct

direct2 = `pwd`
p direct2

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
  if File.exist?(name)
    if File.directory?(name)
      puts "#{name} is a directory"
    else
      puts "#{name} is a file"
    end
  else
    puts "There's no file/directory of that name in current directory."
  end
end

dir_or_file("myfile.txt")
dir_or_file("..")
dir_or_file("holla holla")
dir_or_file("../boy")