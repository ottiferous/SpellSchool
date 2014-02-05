require './tile.rb'
require './board.rb'

class Game

  attr_reader :board

  def initialize(size=[9,9], bombs=10, symbol="\u24B3")
    @board = Board.new(size, bombs)
    @bomb_locations = @board.find_bombs
    @flag_symbol = symbol
    @blank_symbol = "\u25A2"
    @bomb_symbol = "\u22C7"
  end

  def bomb_tiles
    @bomb_locations.map do |x,y|
      @board.tiles[x][y]
    end
  end

  def flag_location(location)
    sel_tile = @board.select_tile(location)    
    sel_tile.flag = (sel_tile.flag ? false : true)
    sel_tile.display = @flag_symbol
  end

  def already_checked?(position)
    @board.select_tile(position).checked
  end

  def get_input

    input = input
    loop do
      print "\n> "
      input = gets.chomp.split(",")
      input.map!(&:to_i)
      break if valid_input?(input)
    end
      
    if input.length == 3
      input.shift
      flag_location(input)
      return nil
    end

    input
  end
  
  def valid_input?(raw_input)
    pos = [raw_input[0], raw_input[1]]
    (raw_input[0] == @flag_symbol) || (@board.valid_tile? pos)
  end

  def won?
    self.bomb_tiles.all? { |tile| tile.flag }
  end

  def run
    dead = false

    until won? || dead
      p @bomb_locations
      @board.draw_board
      choice = get_input

      if choice.nil?
        next
      else
        result = @board.reveal(choice)
        if result.nil?
          dead = true
        end
      end
    end

    puts "##########    Found them all!!!  ##########" if dead == false
    puts "YOU DIED :(" if dead == true
  end

end

if __FILE__ == $PROGRAM_NAME
  
  g = Game.new
  g.run
  
end