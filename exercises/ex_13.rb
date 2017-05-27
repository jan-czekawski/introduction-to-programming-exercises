contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = { "Joe Smith" => {}, "Sally Johnson" => {} }

contacts.each do |k, v|
  x = k.include?("Joe") ? 0 : 1
  contacts[k][:email] = contact_data[x][0]
  contacts[k][:address] = contact_data[x][1]
  contacts[k][:phone]= contact_data[x][2]
end

contacts["Joe Smith"][:email]
contacts["Sally Johnson"][:phone]

