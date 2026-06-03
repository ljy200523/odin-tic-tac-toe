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
      if check_condition(@player_one)
        break
      end
      @table.print_board
      player_two_position = @player_two.position_input
      @table.place(@player_two.name, player_two_position)
      if check_condition(@player_two)
        break
      end
    end
  end

  def check_condition(player)
    if @table.check_win
      print_win_statement(player)
      return true
    elsif @table.check_full
      print_tie_statement
      return true
    else
      return false
    end
  end

  def print_win_statement(player)
    @table.print_board
    puts "Player #{player.name} wins"
  end

  def print_tie_statement
    @table.print_board
    puts "It's a tie"
  end
end

game = TicTacToe.new
game.play

