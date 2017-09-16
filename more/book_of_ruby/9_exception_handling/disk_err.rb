def ch_disk(char)
  start_dir = Dir.getwd
  begin
    Dir.chdir("#{char}:\\")
    puts `dir`
  rescue => e
    # showFamily(e.class) # => check exception_tree.rb
    puts e.class
    puts e
  ensure
    Dir.chdir(start_dir)
  end
end

ch_disk("D")
ch_disk("X")
ch_disk("ABC")