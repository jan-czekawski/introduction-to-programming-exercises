require "set"
require "yaml"

arr1 = [ ["abba", "gamma", "beta"], [10, 20, 30] ]
arr2 = [1..20, 30...50, 100...900]
arr3 = [ [100, 200, 300], [400, 500, 600] ]
arr4 = [Set.new([1, 2, 3, 1, 2, 3, 4, 5, 4]), Set.new([10, 20, 30, 10])]
File.open("multidoc.yml", "w") do |f|
  YAML.dump(arr1, f)
  YAML.dump(arr2, f)
  YAML.dump(arr3, f)
  YAML.dump(arr4, f)
end



File.open("multidoc.yml") do |f|
  # $arr = Psych.load(f)
  # $arr = Psych.load_file(f)
  $arr = Psych.load_stream(f)
end

$arr.each do |arr|
  p arr
end
