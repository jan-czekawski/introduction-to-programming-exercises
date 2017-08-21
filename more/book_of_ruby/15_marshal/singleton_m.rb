require "yaml"

ob = Object.new

class << ob
  def xxx(str)
    @x = str
  end
end

ob.xxx("home")
p ob

# File.open("singleton.sav", "w") do |f|  # => error, cause can't dump singletons
#   Marshal.dump(ob, f)
# end

File.open("test.yml", "w") do |f|
  YAML.dump(ob, f)
end

ob.xxx("new string")
p ob
p ob.singleton_methods

File.open("test.yml") do |f|
  ob = YAML.load(f)
end

p ob
p ob.singleton_methods

begin
  ob.xxx("hope")
rescue => e
  p e
  p e.backtrace
  p caller
end