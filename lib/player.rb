class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def position_input
    loop do
      puts "Player #{self.name} to place: "
      player_position = gets
      coords = player_position.split(",").map(&:to_i)
      if coords.all? { |num| (0..2).include?(num) }
        puts coords
        return coords
      else
        puts "Out of bounds!"
      end
    end
  end
end
