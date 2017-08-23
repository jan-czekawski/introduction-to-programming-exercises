require "find"

$total_size = 0
$dir_size = 0
$files = []
$dirs = []

def process_files(base_dir)
  Find.find(base_dir) do |path|
    $dir_size += $dir_size
    if FileTest.directory?(path) && path != base_dir # if directory
      $dirs << "#{path} [#{$dir_size / 1024}K]"
      $dir_size = 0
    else # if file
      $file_size = File.size(path)
      $files << "#{path} [#{$file_size} bytes]"
      $dir_size += $file_size
      $total_size += $file_size
    end
  end
end

process_files(".")
# process_files("..")
puts "Files..."
puts $files.sort
puts "\nDirectories..."
puts $dirs.sort
printf("Total: #{$total_size} bytes, #{$total_size/1024}K, %0.02fMB\n\n", "#{$total_size/1048576.0}")
puts "Total files: #{$files.size}, Total directories: #{$dirs.size}"
