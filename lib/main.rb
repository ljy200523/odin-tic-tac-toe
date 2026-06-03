require_relative "table"
require_relative "player"

class TicTacToe
  def initialize
    @player_one = Player.new("X")
    @player_two = Player.new("O")
    @table = Table.new
  end
  def play
    while true
      @table.print_board
      player_one_position = @player_one.position_input
      @table.place(@player_one.name, player_one_position)
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
      @table.print_board
      player_two_position = @player_two.position_input
      @table.place(@player_two.name, player_two_position)
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

game = TicTacToe.new
game.play

