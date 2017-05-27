def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# it gives us an error, because we haven't prepend argument name with "&",
# because of that block wasn't converted into Proc