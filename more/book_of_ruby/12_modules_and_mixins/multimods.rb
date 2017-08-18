# DON'T DO IT THIS WAY!!!
module MagicThing
  class MagicClass
  end
end

module Treasure
end

module MethalThing
  include MagicThing
  class Attributes < MagicClass
  end
end

include MethalThing
class Weapon < MagicClass
  class WeaponAttributes < Attributes
  end
end

class Sword < Weapon
  include Treasure
  include MagicThing
end
