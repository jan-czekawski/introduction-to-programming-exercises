File.foreach("copy_1regex.rb") do |line|
  line = line.sub(/(^\s*)#(.*)/, '\1//\2')
  puts line
end