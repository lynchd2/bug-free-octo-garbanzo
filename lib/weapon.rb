class Weapon
  attr_reader :name, :damage
  attr_accessor :bot

  def initialize(name, damage = 0, bot = nil)
    raise ArgumentError.new("") if name.class != String
    raise ArgumentError.new("") if damage.class != Fixnum
    @name = name
    @damage = damage
    raise ArgumentError.new("") if bot != nil
    @bot = bot

    
  end

  def picked_up?
    
  end

  



end