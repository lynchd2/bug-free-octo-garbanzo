class Weapon
  attr_accessor :bot
  attr_reader :name, :damage

  def initialize(name, damage = 0, bot = nil)
    raise ArgumentError.new("") if name.class != String
    raise ArgumentError.new("") if damage.class != Fixnum
    @name = name
    @damage = damage
    @bot = bot

  end

  def bot(battle_bot)
    raise ArgumentError.new("") if battle_bot.class != BattleBot
    self.bot = battle_bot
    return battle_bot if battle_bot == nil
  end

  def picked_up?
    if self.bot == nil
      return false
    else
      return true
    end
  end

end