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
      row, col = position.split(", ")
      row = row.to_i
      col = col.to_i
      puts "string: #{row}"
      puts "string: #{col}"
      @space[row][col] = player
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


player_one = Players.new("X")
player_two = Players.new("O")
table = Table.new
while true
  loop do
    table.print_board
    puts "Player one to place: "
    player_one_position = gets
    coords = player_one_position.split(",").map(&:to_i)
    if coords.all? { |num| (0..2).include?(num) }
      table.place(player_one.name, player_one_position)
      break
    else
      puts "Out of bounds!"
    end
  end
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
  loop do
   table.print_board
    puts "Player two to place: "
    player_two_position = gets
    coords_two = player_two_position.split(",").map(&:to_i)
    if coords_two.all? { |num| (0..2).include?(num) }
      table.place(player_two.name, player_two_position)
      break
    else
      puts "Out of bounds!"
    end
  end
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
