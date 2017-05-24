top_games = { kotor: "rpg", ff7: "rpg", gta_sa: "action-adventure" }
good_games = { pes: "sports", nba_2k17: "sports", mass_effect: "rpg" }

mikes_best = top_games.merge(good_games)
puts "Mike thinks that following games are the best:"
puts mikes_best.keys
puts "But I'm not convinced. My favourite list would still be:"
puts top_games.keys

jerrys_best = top_games.merge!(good_games)
puts "Jerry also thinks that those games are the best:"
puts jerrys_best.keys
puts "Jerry's verry persuasive. I think he's right. From now on my favourite list consists of:"
puts top_games.keys
