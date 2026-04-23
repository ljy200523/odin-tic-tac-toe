class Players
  attr_accessor :name
  def initialize(name)
    @name = name
  end  
end

class Table
  attr_accessor :space, :place
  def initialize
    space = Array.new(3) {Array.new(3, "placeholder")} 
  end
  def place(player, row, col)
    space[row][col] = player
  end
  def self.check_win()
    three_in_a_row ? true : false
  end
end

player_one = Players.new("X")
puts player_one.name
table = Table.new
table.place("X", 1, 2)
p table.space
