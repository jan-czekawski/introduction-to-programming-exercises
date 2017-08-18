load("1modules.rb", false)

p "NEXT"
p MyModule.greet
p MyModule::GOOD_MOOD
include MyModule
p greet