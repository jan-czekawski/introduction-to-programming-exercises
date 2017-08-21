x = /#/.match("def my_meth # This is a very nice method")
p x.pre_match
p x.post_match
p $`
p $'
