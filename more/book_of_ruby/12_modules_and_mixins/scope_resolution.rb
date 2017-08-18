ACONST = "hello"

module OuterMod
  module InnerMod
    ACONST = 10
    class Class1
      class Class2
        module XYZ
          class ABC
            ACONST = 100
            def xyz
              puts ::ACONST     # => top level aconst
            end
          end
        end
      end
    end
  end
end

p OuterMod::InnerMod::ACONST
p OuterMod::InnerMod::Class1::Class2::XYZ::ABC::ACONST
ob = OuterMod::InnerMod::Class1::Class2::XYZ::ABC.new
ob.xyz
