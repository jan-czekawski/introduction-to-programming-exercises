require "yaml"

f = File.open("friends.yml", "w")
YAML.dump(["fred", "bert", "mary"], f)
f.close

File.open("more_friends.yml", "w") do |friends_file|
  YAML.dump(["sally", "agnes", "jon"], friends_file)
end

# File.open("more_friends.yml") do |f|
File.open("more_friends.yml", "r") do |f|
  $arr = YAML.load(f)
end

p $arr