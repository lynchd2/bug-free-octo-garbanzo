class BattleBot
  @@count = 0
  attr_reader :name, :weapon, :health, :count
 

  def initialize(name, weapon = nil)
    @name = name
    @health = 100
    @weapon = weapon
    @@count += 1
    @enemies = []
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
  end

  def has_weapon?
    return @weapon != nil
  end

  def pick_up(new_weapon)
    raise ArgumentError.new("") if new_weapon.class != Weapon
    raise ArgumentError.new("") if new_weapon.bot != nil
    if @weapon == nil
       @weapon = new_weapon 
     end
  end

  def drop_weapon
    self.weapon = nil
  end

  def take_damage(damage)
    raise ArgumentError.new("") if damage.class == String
    self.health -= damage
    @@count -= 1 if self.health < 1
    return @health
  end

  def heal
    self.health += 10 unless self.health > 99 || self.health < 1
  end

  def attack(bot)
    raise ArgumentError.new("") if bot.class != BattleBot
    raise ArgumentError.new("") if bot == self
    raise ArgumentError.new("") if bot.weapon == nil
    bot.receive_attack_from(self)
  end

  def receive_attack_from(enemy)
    if self.enemies.include?(enemy)
      self.enemies << enemy 
    end
    take_damage(enemy.weapon.damage)
    self.defend_against(enemy)
  end

  def defend_against(bot)
    if !dead? && has_weapon?
      self.attack(bot)
    end
  end

  private

  def health=(health)
    @health = health
  end

  def weapon=(weapon)
    @weapon = weapon
  end



end