  class Table
    attr_reader :space
    def initialize
      @space = Array.new(3) {Array.new(3, " ")}
    end
    def place(player, coords)
        row = coords[0]
        col = coords[1]
        # puts "string: #{row}"
        # puts "string: #{col}"
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
