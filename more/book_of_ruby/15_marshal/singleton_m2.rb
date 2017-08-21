# no singleton, just instant var @x, specified to dump and how to reconstruct

class X
  def marshal_dump
    [@x]
  end
  
  def marshal_load(data)
    @x = data[0]
  end
end

ob = X.new
p ob

class << ob
  def xxx(str)
    @x = str
  end
end

ob.xxx("first default string")
p ob

File.open("test2.sav", "w") do |f|
  Marshal.dump(ob, f)
end

ob.xxx("new string")
p ob.singleton_methods

File.open("test2.sav") do |f|
  ob = Marshal.load(f)
end

p ob.singleton_methods