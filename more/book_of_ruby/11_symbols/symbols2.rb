x = 1
xsymbol = :x

def meth(arg)
  p arg
end

meth(x)
meth(:x)

meth(:x.id2name)
meth(eval(:x.id2name))

p "#NEXT#"

meth(xsymbol)
meth(:xsymbol)
meth(eval(:xsymbol.id2name))
meth(eval(eval(:xsymbol.id2name).id2name))
method(:meth).call("")