require "find"
require "thread"

$total_size = 0
$dir_size = 0

semaphore = Mutex.new

def process_files(base_dir)
  Find.find(base_dir) do |path|
    $dir_size += $dir_size
    if FileTest.directory?(path) && path != base_dir # if directory
      print "\n#{path} [#{$dir_size / 1024}K]"
      $dir_size = 0
    else  # if file
      $file_size = File.size(path)
      print "\n#{path} [#{$file_size} bytes]"
      $dir_size += $file_size
      $total_size += $file_size
    end
  end
end

t1 = Thread.new do
  semaphore.synchronize do
    # sleep(1)  # => to see "Processing..."
    process_files("..")   # can edit directory here
  end
end

t2 = Thread.new do
  semaphore.synchronize do
    while t1.alive? do
      print "\n\t\tProcessing..."
    end
  end
end

t2.join

printf "\nTotal: #{$total_size} bytes, #{$total_size/1024}K, %0.02fMB\n\n", "#{$total_size/1048576.0}"
puts "Total file size: #{$file_size}, Total directory size: #{$dir_size}"


