$dir_size = 0
$dirs = {}
$files = {}

def process_files(dir)
  total_bytes = 0
  Dir.foreach(dir) do |f|
    my_path = "#{dir}/#{f}"
    
    if File.directory?(my_path)
      if f != "." && f != ".."
        d_size = process_files(my_path) / 1024
        $dirs[my_path] = d_size
      end
    else
      file_size = File.size(my_path)
      total_bytes += file_size
      $files[my_path] = file_size
    end
  end
  
  $dir_size += total_bytes
  total_bytes
end

dir_name = ".."

unless File.directory?(dir_name)
  puts "#{dir_name} is not a valid directory"
else
  process_files(dir_name)
  printf("Size of this directory and subdirectories is #{$dir_size} bytes, #{$dir_size / 1024}K, %0.02fMB\n\n", "#{$dir_size / 1048576.0}")
  p "File sizes (ascending)..."
  $files = $files.sort { |a, b| a[1] <=> b[1] }
  $files.each { |fname, fsize| p "#{fname} : #{fsize} bytes" }
  p "Directory sizes (descdending)..."
  $dirs = $dirs.sort { |a, b| b[1] <=> a[1] }
  $dirs.each { |dname, dsize| p "#{dname} : #{dsize}K"}
end



