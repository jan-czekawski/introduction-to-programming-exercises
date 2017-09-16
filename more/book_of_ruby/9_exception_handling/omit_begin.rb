def calc
  1 / 0
  rescue => e
    puts e.class
    puts e
    result = nil
  # return result
  result
end

class X
  @@x = 1 / 0
  rescue => e
    puts e.class
    puts e
    # puts @@x NameError (uninitialized)
end

module Y
  @@x = 1 / 0
  rescue => e
    puts e.class
    puts e
    # puts @@x NameError (uninitialized)
end

p calc