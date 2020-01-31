class Dog 
  attr_accessor :name, :breed
  attr_reader :id
  def initilize(name:,breed:, id:=nil)
    @name = name
    @bree = breed
    @id = id
  end
  def self.new_from_db
  end 
  def self.find_by_name
  end 
  def update
  end 
  def save 
 end
end