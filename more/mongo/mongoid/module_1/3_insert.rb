db[:zips].insert_one(:_id => "100", :city => "city01",
                     :loc => [-76.0592270001, 39.564894],
                     :pop => 4678, :state => "MD")

db[:zips].find(:city => "city01").count
db[:zips].find(:city => "city01").to_a

db[:zips].insert_many([{ :_id => "200", :city => "city02",
                         :loc => [-74.05922, 37.56489],
                         :pop => 2000, :state => "CA" },
                       { :_id => "201", :city => "city03",
                         :loc => [-75.0592, 35.5648],
                         :pop => 3000, :state => "CA" }])
                         
db[:zips].find(:_id => "200").to_a
db[:zips].find(:_id => "201").to_a