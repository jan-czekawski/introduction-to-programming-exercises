require "yaml"

arr1 = [ ["The Groovesters", "Groovey Tunes", 123],
         ["The Loonsters", "Looney Tunes", 456] ]
         
puts arr1.to_yaml



arr2 = [ arr1, [ [10, 20, 30], [50, 60, 80] ], [ [100, 200, 300], [500, 600, 700 ] ] ]
puts arr2.to_yaml

class CD
  def initialize(artist, name, num_tracks)
    @artist = artist
    @name = name
    @num_tracks = num_tracks
  end
end

arr2 = [ CD.new("The Beasts", "Beastly Tunes", 22), 
         CD.new("The Strolling Bones", "Songs for Senior Citizens", 38) ]
puts arr2.to_yaml
puts arr2

