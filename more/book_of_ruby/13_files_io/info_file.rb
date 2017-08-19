$dir_size = 0

def process_files(dir)
  total_bytes = 0
  Dir.foreach(dir) do |f|
    my_path = "#{dir}/#{f}"
    # s = ""
    
    if File.directory?(my_path)
      if f != "." && f != ".."
        bytes_in_dir = process_files(my_path) # recurse
        puts "<DIR> --->
              #{my_path} contains [#{bytes_in_dir/1024}] KB"
      end
    else
      file_size = File.size(my_path)
      total_bytes += file_size
      puts "#{my_path} : #{file_size/1024}K"
    end
  end
  
  $dir_size += total_bytes
  total_bytes
end

# dir_name = ".." # => parent of the current dir, but can change it
dir_name = "." # => parent of the current dir, but can change it

unless File.directory?(dir_name)
  puts "#{dir_name} is not a valid directory"
else
  process_files(dir_name)
  printf("Size of this directory and subdirectories is #{$dir_size} bytes, #{$dir_size/1024}K, %0.02fMB", "#{$dir_size/1048576.0}")
end




