# Write a method that returns true if its argument looks like a URL,
# false if it does not.

def url?(txt)
  # if txt.match(/\Ahttps?:\/\/\S*\z/)
  # if txt.match(/^https?:\/\/\S*$/)
  # if txt.match(/\Ahttps?:\/\/(\w+\.)+\w+\z/)
    # true
  # else
  #   false
  # end
  
  !!txt.match(/\Ahttps?:\/\/\S*\z/)
end

p url?('http://launchschool.com')   # -> true
p url?('https://example.com')       # -> true
p url?('https://example.com hello') # -> false
p url?('   https://example.com')    # -> false