class Dog
  attr_accessor :name, :breed
  attr_reader :id
  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed
    @id = id
  end
  def self.create_table
    sql=<<-SQL
    CREATE TABLE IF NOT EXISTS dogs(
    name TEXT
    breed TEXT 
    )
    SQL
    DB[:conn].execute(sql)
  end
  def self.drop_table
    sql=<<-SQL
    DROP TABLE IF EXISTS dogs
    SQL
    DB[:conn].execute(sql)
  end
  def save
    sql=<<-SQL
    INSERT INTO dogs(name, breed)
    Values (?,?)
    SQL
    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    self
  end
  def self.create(name:,breed:)
    dog = self.new(name: name, breed: breed)
    dog.save
    dog
  end
  def self.new_from_db(row)
    dog = Dog.new(name: row[1], breed: row[2], id: row[0])
    dog
  end
  def self.find_by_id(id)
    sql = <<-SQL
      SELECT * FROM dogs WHERE id = ?
    SQL
    result = DB[:conn].execute(sql, id)[0]
    dog = self.new_from_db(result)
  end
  def self.find_or_create_by(name:,breed:)
  end
  def self.find_by_name(name)
  end
  def update
  end
end