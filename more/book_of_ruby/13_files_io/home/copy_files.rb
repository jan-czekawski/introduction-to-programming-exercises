require "fileutils"

overwrite_prompt = true

# get source dir
puts "FROM which directory would you like to copy the files?"
sourcedir = gets.chomp

unless File.directory?(sourcedir)
  puts "A directory called #{sourcedir} cannot be found!"
else
  # get target dir
  puts "INTO which directory would you like to copy the files?"
  targetdir = gets.chomp
  
  ok = true
  unless File.directory?(targetdir)
    ok = false
    puts "#{targetdir} cannot be found!"
    puts "Would you like to create it?"
    answer = gets
    if answer[0, 1].downcase == "y"
      FileUtils.mkdir(targetdir)
      ok = true
    end
  end
  
  if ok
    Dir.foreach(sourcedir) do |f|
      filepath = "#{sourcedir}/#{f}"
      p filepath: filepath, sourcedir: sourcedir, targetdir: targetdir
      # if !(File.directory?(filepath))
      unless File.directory?(filepath)
        if File.exist?("#{targetdir}/#{f}")
          puts "#{f} already exists in target directory"
        else
          FileUtils.cp(filepath, targetdir)
          puts "Copying... #{filepath}"
        end
      end
    end    
  end
  
end  # if sourcedir was not found
puts "End"
