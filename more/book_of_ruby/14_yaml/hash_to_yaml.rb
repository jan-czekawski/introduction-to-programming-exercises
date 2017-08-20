require "yaml"

hsh = { friend1: "mary",
        friend2: "sally",
        friend3: "gary",
        morefriends: { chap_i_met_in_the_bar: "simon",
                       girl_next_door: "wanda" 
                     }
      }

p hsh
puts hsh.to_yaml

# www.yaml.org for more info
