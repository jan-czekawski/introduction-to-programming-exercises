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