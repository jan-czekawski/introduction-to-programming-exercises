f = File.open("test2.sav")

if RUBY_VERSION.to_f > 1.8
  vMajor = f.getc.ord
  vMinor = f.getc.ord
else
  vMajor = f.getc
  vMinor = f.getc
end

File.open("home.txt", "w") do |f|
  f << "cherry"
end

m = File.open("home.txt")
p m.getc
p m.getc

File.open("home.txt") do |f|
  p f.readlines
end

p m.readlines

if vMajor == Marshal::MAJOR_VERSION
  puts "Major version is compatible"
  if vMinor == Marshal::MINOR_VERSION
    puts "Minor version is compatible"
  elsif vMinor < Marshal::MINOR_VERSION
    puts "Minor version is lower - old file format"
  else
    puts "Minor version is higher - newer file format"
  end
else
  puts "Major version is incompatible"
end

