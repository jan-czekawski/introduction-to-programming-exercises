def is_new_ruby
  new_r = false # is this > Ruby version 1.8?
  
  major_num = RUBY_VERSION[0, 1]
  minor_num = RUBY_VERSION[2, 1]
  if major_num == "2" || minor_num == "9"
    new_r = true
  else
    # new_r == false
    new_r = false
  end
  new_r
end

p is_new_ruby