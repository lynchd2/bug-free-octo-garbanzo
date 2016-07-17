class Weapon
  attr_reader :name, :damage, :bot

  def initialize(name, damage = 0)
    raise ArgumentError.new("") if name.class != String
    raise ArgumentError.new("") if damage.class != Fixnum
    @name = name
    @damage = damage
    @bot = nil

    
  end

  def picked_up?
    !!@bot
  end

  def bot=(bot)
    if !bot.is_a?(BattleBot)
      if bot != nil
        raise ArgumentError.new("")
      else
        bot = nil
      end
    else
      @bot = bot
    end
  end



end