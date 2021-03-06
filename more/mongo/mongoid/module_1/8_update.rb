# update

# replace_one
db[:zips].insert_one(:_id => "100",
                     :city => "citytemp",
                     :loc => [ -76.0592, 39.5648 ],
                     :pop => 4678,
                     :state => "MD")
db[:zips].find(:_id => "100").replace_one(:_id => "100",
                                          :city => "city02",
                                          :loc => [-100.2, -200.1],
                                          :pop => 2000,
                                          :state => "MD")
db[:zips].find(:_id => "100").to_a

# update_one
db[:zips].find(:_id => "100").update_one(:$set => {:city => "name2"})
db[:zips].find(:_id => "100").to_a

# update_many
db[:zips].find(:state => "MD").count

db[:zips].find(:state => "MD").update_many(:"$set" => { state: "XX" })
db[:zips].find(:state => "MD").count
db[:zips].find(:state => "XX").count

# delete_one
db[:zips].find(:city => "name2").count
db[:zips].find(:city => "name2").delete_one()
db[:zips].find(:city => "name2").count


# delete_many
db[:zips].find(:state => "MD").count
db[:zips].find(:state => "MD").delete_many()
db[:zips].find(:state => "MD").count


# upsert
db[:zips].find(:city => "ODENVILLE1").count
db[:zips].find(:city => "ODENVILLE2").count
db[:zips].find(:city => "ODENVILLE1").update_one({:$set => {:city => "ODENVILLE2"}}, :upsert => true)
db[:zips].find(:city => "ODENVILLE1").count
db[:zips].find(:city => "ODENVILLE2").count