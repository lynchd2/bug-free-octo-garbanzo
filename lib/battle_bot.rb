require_relative 'weapon'

class BattleBot

  attr_reader :name, :weapon, :health, :enemies
  @@count = 0

  def initialize(name, weapon = nil)
    @name = name
    @health = 100
    @weapon = weapon
    @enemies = []
    @@count += 1
  end

  def self.count
    @@count
  end

  def dead?
    self.health <= 0
  end

  def has_weapon?
    self.weapon != nil
  end

  def pick_up(new_weapon)
    raise ArgumentError.new("") if new_weapon.class != Weapon
    raise ArgumentError.new("") if new_weapon.bot != nil
    if @weapon == nil
       @weapon = new_weapon 
       @weapon.bot = self
       @weapon
    end
  end

  def drop_weapon
    @weapon.bot = nil
    @weapon = nil
  end

  def take_damage(damage)
    raise ArgumentError.new("") if !damage.is_a?(Fixnum)
    @health -= damage
    @health = 0 if @health <= 0
    @@count -= 1 if @health <= 0
    @health
  end

  def heal
    @health += 10 unless @health > 99 || @health < 1
  end

  def attack(enemy)
    raise ArgumentError.new("") if !enemy.is_a?(BattleBot) || enemy == self || !!enemy.weapon 
    enemy.receive_attack_from(self)
  end

  def receive_attack_from(enemy)
    if !enemy.is_a?(BattleBot) || enemy.weapon.nil?  || enemy == self
      raise ArgumentError.new("")
    else
      if !enemy.dead? && !self.dead? && enemy.has_weapon?
        @enemies << enemy if !@enemies.include?(enemy)
        take_damage(enemy.weapon.damage)
        defend_against(enemy)
      end
    end
  end

  def defend_against(bot)
    if !(bot.is_a?(BattleBot) || bot == self)
      raise ArgumentError.new("")
    else
      if !dead? && !bot.dead? && has_weapon?
        attack(bot)
      end
    end
  end
end