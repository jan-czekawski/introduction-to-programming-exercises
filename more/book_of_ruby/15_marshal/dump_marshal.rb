def marshal_dump
  [@variable_a, @variable_b]
end

def marshal_load(data)
  @variable_a = data[0]
  @variable_b = data[1]
  @some_other_var = "a default value"
end

