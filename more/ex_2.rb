def execute(&block)
  # block
  block.call
end

execute { puts "Hello from inside the execute method!" }

# program won't print anything, because block wasn't called. It will return Proc.