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
    CREATE TABLE IF NOT EXISTS dogs
    SQL
    DB[:conn].execute(sql)
  end
  def self.drop_table
  end
  def save
  end
  def self.create(name:,breed:)
  end
  def self.new_from_db(row)
  end
  def self.find_by_id(id)
  end
  def self.find_or_create_by(name:,breed:)
  end
  def self.find_by_name(name)
  end
  def update
  end
end