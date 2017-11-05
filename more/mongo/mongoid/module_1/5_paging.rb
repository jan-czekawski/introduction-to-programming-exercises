db[:zips].find.limit(3).each { |r| pp r}
db[:zips].find.limit(5).each { |r| pp r}
db[:zips].find.skip(3).limit(3).each { |r| pp r}

# sorts
# 1 for ascending
db[:zips].find.limit(3).sort(:city => 1).each { |r| pp r}
# -1 for desc
db[:zips].find.limit(3).sort(:city => -1).each { |r| pp r}