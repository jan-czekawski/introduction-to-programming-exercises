family = 
  { uncles: ["bob", "joe", "steve"],
    sisters: ["jane", "jill", "beth"],
    brothers: ["frank", "rob", "david"],
    aunts: ["mary", "sally", "susan"] }

imm_family = Array.new

temp_hash = family.select { |k, v| k == :sisters || k == :brothers }
temp_hash.each do |relation, names|
  names.each do |x|
    imm_family << x
  end
end

p imm_family