require "yaml"

# array for cd objects
$cd_arr = []

# file for saving/loading
$fn = "cd_db.yml"

class CD
  def initialize(arr)
    @name = arr[0]
    @artist = arr[1]
    @num_tracks = arr[2]
  end
  
  def get_details
    [@name, @artist, @num_tracks]
  end
end

class PopCD < CD
  def initialize(arr)
    super(arr)
    @genre = arr[3]
  end
  
  def get_details
    super << @genre
  end
end

class ClassicalCD < CD
  def initialize(arr)
    super(arr)
    @conductor = arr[3]
    @composer = arr[4]
  end
  
  def get_details
    super << @conductor << @composer
  end
end

# methods to get data from user
def other_cd
  print "Enter CD name: "
  cd_name = gets.chomp
  print "Enter artist's name: "
  a_name = gets.chomp
  print "Enter number of tracks: "
  num_tracks = gets.chomp.to_i
  [cd_name, a_name, num_tracks]
end

def classic_cd
  cd_info = other_cd
  print "Enter conductor's name: "
  con_name = gets.chomp
  print "Enter composer's name: "
  comp_name = gets.chomp
  cd_info << con_name << comp_name
  cd_info
end

def pop_cd
  cd_info = other_cd
  print "Enter genre of music: "
  genre = gets.chomp
  cd_info << genre
  cd_info
end

# add CD object to the array variable, $cd_arr
def add_cd(a_cd)
  $cd_arr << a_cd
end

# saves data to disk in yaml format
def save_db
  File.open($fn, "w") do |f|
    f.write($cd_arr.to_yaml)
  end
end

# loads data from disk and recreates the array of cd objects
def load_db
  input_data = File.read($fn)
  $cd_arr = YAML.load(input_data)
end

# prints data from the array to screen in human readable yaml format
def show_data
  puts $cd_arr.to_yaml
end

# start of the program
if File.exist?($fn)
  load_db
  show_data
else
  puts "The file #{$fn} cannot be found."
end

# main loop
ans = ""
until ans == "q"
  puts "Create (P)op CD (C)lassical CD, (O)ther CD - (S)ave or (Q)uit?"
  print "> "
  ans = gets[0].chr.downcase
  case ans
  when "p" then add_cd(PopCD.new(pop_cd))
  when "c" then add_cd(ClassicalCD.new(classic_cd))
  when "o" then add_cd(CD.new(other_cd))
  when "s" then save_db
  end
  show_data
end
