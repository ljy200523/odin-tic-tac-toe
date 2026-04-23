class Players
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Table
  attr_accessor :space
  def initialize
  end
  def space()
    space = Array.new(3) {Array.new(3, "tired")}
  end
  def self.check_win()
    three_in_a_row ? true : false
  end
end

player_one = Players.new("X")
puts player_one.name
table = Table.new
p table.space