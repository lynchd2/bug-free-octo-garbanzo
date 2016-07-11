class BattleBot
  attr_reader :name
  attr_accessor :weapon, :health

  def initialize(name, weapon = nil)
    @name = name
    @health = 100
    @weapon = weapon
  end

  def enemies
    all_enemies = []
    return []
  end

  def dead?
    if self.health <= 0
      return true
    else
      return false
    end
    return true
  end

  def has_weapon?
    return true if self.weapon != nil
    return false
  end

  def pick_up(weapon)
    raise ArgumentError.new("") if weapon.class != Weapon
    @weapon = weapon if @weapon == nil
  end

  def drop_weapon
    self.weapon = nil
  end

  def take_damage(damage)
    raise ArgumentError.new("") if damage.class == String
    self.health -= damage
    return @health
  end

  def heal
    self.health += 10 unless self.health > 99 || self.health < 1
  end

  def attack(bot)
    raise ArgumentError.new("") if bot.class == String
    raise ArgumentError.new("") if bot == self
  end

  def recieve_attack_from(enemy)
    raise ArgumentError.new("") if enemey.class != BattleBot
  end

  def defend_against(bot)
  end



end