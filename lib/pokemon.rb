class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(attributes)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}');")
  end

  def self.find(id, db)
    attributes = {
      :id => db.execute("SELECT pokemon.id FROM pokemon WHERE pokemon.id == #{id};")[0][0],
      :name => db.execute("SELECT pokemon.name FROM pokemon WHERE pokemon.id == #{id};")[0][0],
      :type => db.execute("SELECT pokemon.type FROM pokemon WHERE pokemon.id == #{id};")[0][0]
    }
    puts attributes
    self.new(attributes)
  end

end
