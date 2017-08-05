require "./m_user"

# using M # => to activate refinement in this scope also

x = C.new
m_user = MUser.new

# MUser#call_foo was defined in file m_user; refinement was activated in that file
# since we use require to load that file => ref. is active in file main.rb
m_user.call_foo(x) # => ok

# C#foo was defined in module M in file m.rb, refinement is NOT activated there.
# hence it's not active in this file.
# x.foo # => error, unless we activate refinement also in this scope

