def sing
  puts "Tra-la-la-la-la..."
end

puts "module loaded"
sing

module MyModule
  def self.home
    "home home"
  end
  
  def work
    "work work"
  end
end