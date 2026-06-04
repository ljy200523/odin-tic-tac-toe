require_relative "../lib/player.rb"
require_relative "../lib/table.rb"
require_relative "../lib/main.rb"

describe TicTacToe do
  describe "#play" do
  end
  describe "#position_input" do
    subject(:game) { described_class.new() }
    let(:player_x) { Player.new("X") }

    context "when input is outside range" do
      it "print error message" do
        invalid_input = -1
        allow(player_x.position_input).to receive(:gets).and_return(invalid_input)
        expect { player_x.position_input }.to output("Player X to place: \n").to_stdout
        player_x.position_input
      end
    end
    context "when input is already taken" do
      xit "print error message" do
        player_x.position_input
      end
    end
  end
  describe "#place" do #Outgoing Command - Test outgoing message; Mock
    subject(:game) { described_class.new() }
    let(:player_x) { Player.new("X") }
    let(:table) { Table.new }

    context "when given the position" do
      it "inserts player's symbol into table" do
        position = [0, 1]
        expect{ table.place(player_x.name, position) }.to change { table.space }
        table.place(player_x.name, position)
      end
    end
  end
  describe "#check_condition" do
  end
  describe "#check_win" do
    subject(:game) { described_class.new }
    let(:table) { Table.new }

    context "someone has won the game" do
      it "returns true" do
        # Use object.instance_variable_set because of
        # Table - attr_reader :space
        table.instance_variable_set(:@space,
                      [["X","X","X"],
                       ["O"," "," "],
                       [" ","O"," "]])
        expect(table.check_win).to be true
      end
    end
    context "no player has won the game" do
      it "returns false" do
        table.instance_variable_set(:@space,
                      [["X"," ","X"],
                       ["O"," "," "],
                       [" ","O"," "]])
        expect(table.check_win).to be false
      end
    end
  end
  describe "#check_full" do
    subject(:game) { described_class.new }
    let(:table) { Table.new }

    context "when board is full" do
      it "returns true" do
        table.instance_variable_set(:@space,
                      [["X","O","X"],
                       ["O","X","O"],
                       ["O","X","O"]])
        expect(table.check_full).to be true
      end
    end
    context "when board is not full" do
      it "returns false" do
        table.instance_variable_set(:@space,
                      [["X"," ","X"],
                       ["O"," "," "],
                       [" ","O"," "]])
        expect(table.check_full).to be false
      end
    end
  end

end

