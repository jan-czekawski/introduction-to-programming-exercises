puts require "./testmod.rb"
puts require "./testmod.rb"
puts require_relative "testmod.rb"

# p $:
# $: << "benihana"
# p $:

p MyModule.home
# p work  error
include MyModule
p work
