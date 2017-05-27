contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = { "Joe Smith" => {}, "Sally Johnson" => {} }
data = [:email, :address, :phone]

contacts.each do |k, v|
  x = k.include?("Joe") ? 0 : 1
  data.each do |item|
    contacts[k][item] = contact_data[x][data.index(item)]
  end
end