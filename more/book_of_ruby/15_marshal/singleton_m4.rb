def make_into_singleton(some_ob)
  class << some_ob
    def xxx=(str)
      @x = str
    end
    
    def xxx
      @x
    end
  end
  some_ob
end