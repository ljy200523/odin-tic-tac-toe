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
  def place(player, position)
    if position.class == Array
      row, col = position
      @space[row][col] = player
    end
    if position.class == String
      row, col = position.split(", ")
      row = row.to_i
      col = col.to_i
      @space[row][col] = player
    end
  end
  def check_win()
    for i in 0..2  #for loop, inclusive range from 0 to 2
      if @space[0][i] == @space[1][i] && @space[1][i] == @space[2][i] && @space[2][i] != " " #iterating through each column
        return true
      elsif @space[i][0] == @space[i][1] && @space[i][1] == @space[i][2] && @space[i][2] != " " #iterating through each row
        return true
      end
    end
    if @space[0][0] == @space[1][1] && @space[1][1] == @space[2][2] && @space[2][2] != " " #diagonal
      return true
    elsif @space[0][2] == @space[1][1] && @space[1][1] == @space[2][0] && @space[2][0] != " " #diagonal
      return true
    else return false
    end
  end
  def check_full
    @space.all? do |row|
      row.none? {|element| element == " "}
    end
  end
  def print_board
    @space.each {|subarray| p subarray }
  end
end

# player_one = Players.new("X")
# player_two = Players.new("O")
# table = Table.new
# table.place(player_one.name, "0, 0")
# table.place(player_two.name, "0, 1")
# table.place(player_two.name, "0, 2")
# table.place(player_two.name, "1, 0")
# table.place(player_one.name, "1, 1")
# table.place(player_one.name, "1, 2")
# table.place(player_two.name, "2, 0")
# table.place(player_one.name, "2, 1")
# table.place(player_two.name, "2, 2")
# table.print_board
# puts table.check_win()
# puts table.check_full()


player_one = Players.new("X")
player_two = Players.new("O")
table = Table.new
while true
  table.print_board
  puts "Player one to place: "
  player_one_position = gets
  table.place(player_one.name, player_one_position)
  if table.check_win()
    table.print_board
    puts "Player 1 wins"
    break
  end
  if table.check_full()
    table.print_board
    puts "It's a tie"
    break
  end
  table.print_board
  puts "Player two to place: "
  player_two_position = gets
  table.place(player_two.name, player_two_position)
  if table.check_win()
    table.print_board
    puts "Player 2 wins"
    break
  end
  if table.check_full()
    table.print_board
    puts "It's a tie"
    break
  end
end

