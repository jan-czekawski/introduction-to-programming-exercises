s = "def myMethod # a comment "

p s.slice(/m.*d/)
p s
p s.slice!(/m.*d/)
p s