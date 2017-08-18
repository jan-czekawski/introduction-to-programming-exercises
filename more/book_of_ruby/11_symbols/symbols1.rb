def meth(do_this)
  if do_this == :delete_files
    puts "Now deleting files..."
  elsif do_this == :format_disk
    puts "Now formatting disk..."
  else
    puts "Sorry, command not understood."
  end
end