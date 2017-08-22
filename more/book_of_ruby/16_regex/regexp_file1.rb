File.open("testfile1.txt", "w") do |f|
  File.foreach("1regex.rb") do |line|
    f.puts line.sub(/(^\s*)#(.*)/, '\1//\2')
  end
end