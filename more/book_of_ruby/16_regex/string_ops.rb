s = "def myMethod # a comment"

p s.split(/m.*d/)
p s.split(/\s/)
p s.split(//)

s = "def myMethod # a comment"
s2 = "The cat sat on the mat"

p s.sub(/m.*d/, 'yourFunction')
p s2.sub(/at/, 'aterpillar')

p s2.gsub(/at/, 'aterpillar')