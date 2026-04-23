class Players
  attr_accessor :name
  def initialize(name)
    @name = name
  end  
end

class Table
  attr_accessor :space, :place
  def initialize
    @space = Array.new(3) {Array.new(3, " ")} 
  end
  def place(player, row, col)
    @space[row][col] = player
  end
  def self.check_win()
    three_in_a_row ? true : false
  end
  def print_board
    @space.each {|subarray| p subarray }
  end
end

player_one = Players.new("X")
player_two = Players.new("O")
table = Table.new
table.place(player_one.name, 1, 2)
table.place(player_two.name, 2, 2)
table.print_board

unless table.check_win
  table.print_board
  puts "Player one to place: "
  player_one_position = gets
  table.check_win() ? break : next

  table.print_board
  puts "Player two to place: "
  player_two_position = gets
  table.check_win() ? break : next