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

dir_name = ".."
