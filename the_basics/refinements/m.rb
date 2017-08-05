require "./c"

module M
  refine C do
    def foo
      puts "C#foo in M"
    end
  end
end

