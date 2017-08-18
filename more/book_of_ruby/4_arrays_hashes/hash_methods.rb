h1 = { "room1" => "The treasure room",
       "room2" => "The throne room",
       "loc1"  => "A forest glade",
       "loc2"  => "A mountain stream" }
       
h2 = { 1 => "one", 2 => "two", 3 => "three" }

p h1, h2
h1["room1"] = "You have wandered into dark room."
p h1
h1.delete("loc2")
p h1

p h1.has_key?("loc2")
p h2.has_value?("two")
p h2.invert
p h2.keys
p h2.values
p h2.key("one")
p h1.key("A forest glade")
p h1.key("A forest glad")

