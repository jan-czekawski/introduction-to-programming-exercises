module One
  class Fred
  end
  
  $f1 = :Fred
  
  def self.eval_fred(symbol)
    puts eval(symbol.id2name)
  end
end

module Two
  Fred = 1
  
  $f2 = :Fred
  
  def self.eval_fred(symbol)
    puts eval(symbol.id2name)
  end
end

def Fred()
  puts "hello from the Fred method"
end

$f3 = :Fred

One::eval_fred($f1)
One::eval_fred($f2)
One::eval_fred($f3)

p "next"

Two::eval_fred($f2)
Two::eval_fred($f1)
Two::eval_fred($f3)

p "next"

method($f3).call
method($f1).call
method($f2).call

x = :x
p x
p x.id2name
p :hello.id2name
p :boss.id2name

def home
  "Home"
end

p eval(:home.id2name)