def show_family(a_class)
  if a_class != nil
    puts "#{a_class} :: about to recurse with a_class.superclass = #{a_class.superclass.inspect}"
    show_family(a_class.superclass)
  end
end

show_family(Integer)
show_family(String)
show_family(File)
show_family(Dir)
