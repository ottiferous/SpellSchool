require 'tile.rb'
require 'board.rb'

class Game

  attr_reader :board

  def initialize(size=[9,9], bombs=10, symbol="F")
    @board = Board.new(size, bombs)
    @bomb_locations = @board.find_bombs
    @flag_symbol = symbol
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

    loop do
      print "#####\n> "
      input.map!(&:to_i)
      input = gets.chomp.split(",")
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
    raw_input[0].include? @flag_symbol &&
    raw_input[1].between? (0,@board.size[0]) &&
    raw_input[2].between? (0,@board.size[1])
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
          dead = true                    # you stepped on a landmine
        end
      end
    end

    puts "##########    Found them all!!!  ##########" if dead == false
    puts "YOU DIED :(" if dead == true
  end

end
