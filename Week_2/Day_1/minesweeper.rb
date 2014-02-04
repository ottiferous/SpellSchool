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
    @board.tiles[position.first][position.last].checked
  end

  def get_input
    print "Please enter coordinates [x, y], start with a letter to flag.\n> "
    input = gets.chomp.split(",")
    input.map!(&:to_i)

    if input.any? { |num| num > @board.size.max || num < 0 }
      puts "Please try again, the selection was out of bounds"
      get_input
    end

    if input.length == 3
      input.shift
      flag_location(input)
      return nil
    end

    input
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