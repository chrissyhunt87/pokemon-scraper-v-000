class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type, hp) VALUES ('#{name}', '#{type}', #{hp});")
  end

  def self.find(id, db)
    attributes = {
      :id => db.execute("SELECT pokemon.id FROM pokemon WHERE pokemon.id == #{id};")[0][0],
      :name => db.execute("SELECT pokemon.name FROM pokemon WHERE pokemon.id == #{id};")[0][0],
      :type => db.execute("SELECT pokemon.type FROM pokemon WHERE pokemon.id == #{id};")[0][0]
    }
    self.new(attributes)
  end

  def alter_hp(id, hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{id}")
  end

end
