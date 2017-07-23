def go(x, *args)
  # puts args.inspect
  p args
end

go("a", "b", "c")

def go(**params)
  p params
  puts params.inspect
end

go(x: 100, y: 200)