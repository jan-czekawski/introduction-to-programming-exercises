h1 = { key1: "val1", key2: "val2", key3: "val3", key4: "val4" }
h2 = { key1: "val1", key_two: "val2",key3: "VALUE_3", key4: "val4"}

p "show keys", h1.keys, h2.keys
p "common keys", h1.keys & h2.keys
p "common values", h1.values & h2.values
p "add keys", h1.keys + h2.keys
p h1.values - h2.values
p h1.keys << h2.keys
p (h1.keys << h2.keys).flatten
p (h1.keys << h2.keys).flatten.reverse