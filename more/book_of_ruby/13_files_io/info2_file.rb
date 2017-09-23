# displaying directory content by size

$dir_size = 0
$files = []

def process_files(dir)
  total_bytes = 0
  Dir.foreach(dir) do |f|
    my_path = "#{dir}/#{f}"
    
    if File.directory?(my_path)
      if f != "." && f != ".."
        fsize = process_files(my_path) / 1024
        puts "<DIR> --->#{my_path} contains [#{fsize}] KB"
        $files << fsize
      end
    else
      file_size = File.size(my_path)
      total_bytes += file_size
    end
  end
  
  $dir_size += total_bytes
  total_bytes
end

dir_name = "."

if !(File.directory?(dir_name))
  puts "#{dir_name} is not a valid directory"
else
  process_files(dir_name)
  printf("Size of #{dir_name} and subdirectories is #{$dir_size} bytes, #{$dir_size/1024}K, %0.02fMB\n\n", "#{$dir_size/1048576.0}")
  p "This is an unordered list of the file sizes..."
  p $files
  p "This is an unordered list of the file sizes (with 0 byte entries deleted)..."
  $files.delete(0)
  p $files
  p "This is a sorted list (low to high) of the file sizes"
  p $files.sort
  p "This is a sorted list (high to low) of the file sizes"
  p $files.sort.reverse
end