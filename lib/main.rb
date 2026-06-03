require_relative "table"
require_relative "player"

class Game
  def initialize
    @player_one = Player.new("X")
    @player_two = Player.new("O")
    @table = Table.new
  end
  def play
    while true
      loop do
        @table.print_board
        puts "Player one to place: "
        player_one_position = gets
        coords = player_one_position.split(",").map(&:to_i)
        if coords.all? { |num| (0..2).include?(num) }
          @table.place(@player_one.name, player_one_position)
          break
        else
          puts "Out of bounds!"
        end
      end
      if @table.check_win()
      @table.print_board
      puts "Player 1 wins"
      break
      end
      if @table.check_full()
        @table.print_board
        puts "It's a tie"
        break
      end
      loop do
      @table.print_board
        puts "Player two to place: "
        player_two_position = gets
        coords_two = player_two_position.split(",").map(&:to_i)
        if coords_two.all? { |num| (0..2).include?(num) }
          @table.place(@player_two.name, player_two_position)
          break
        else
          puts "Out of bounds!"
        end
      end
      if @table.check_win()
        @table.print_board
        puts "Player 2 wins"
        break
      end
      if @table.check_full()
        @table.print_board
        puts "It's a tie"
        break
      end
    end
  end
end

game = Game.new
game.play

