# find with lt and gt operator
db[:zips].find(:city => { :$lt => "D" }).limit(2).to_a.each { |r| pp r }

db[:zips].find(:city => { :$lt => "P", :$gt => "B" }).limit(3).to_a.each { |r| pp r}
db[:zips].find(:city => { :$lt => "P", :$gt => "G" }).limit(3).to_a.each { |r| pp r}

# find by regex
db[:zips].find(:city => { :$regex => "X" }).limit(5).each { |r| pp r}
db[:zips].find(:city => { :$regex => "X$" }).limit(5).each { |r| pp r}
db[:zips].find(:city => { :$regex => "^X" }).limit(5).each { |r| pp r}
db[:zips].find(:city => { :$regex => "^[A-E]" }).projection(:_id => false).limit(5).each { |r| pp r}