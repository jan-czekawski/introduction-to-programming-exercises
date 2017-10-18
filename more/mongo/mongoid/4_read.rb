db[:zips].find(:city => "BALTIMORE") # returns view representation
db[:zips].find(:city => "BALTIMORE").first # query the db to get the data
db[:zips].find.distinct(:state) # returns distinct states from all docs
db[:zips].find(:city => "GERMANTOWN").count
pp db[:zips].find(:city => 'GERMANTOWN', :state => "NY").first # undefined "pp"
require "pp" # pretty printing
pp db[:zips].find(:city => 'GERMANTOWN', :state => "NY").first # OK
pp db[:zips].find(:city => 'GERMANTOWN', :state => "MD").first

db[:zips].find().each { |r| puts r }
db[:zips].find().each { |r| pp r }

# projections
db[:zips].find(:state => "MD").projection(state: true).first
db[:zips].find(:state => "MD").projection(state: true, _id: false).first