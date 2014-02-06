class Board
  
  attr_accessor :tiles
  attr_reader   :size
  
  def initialize(size, num_of_bombs)
    @size = size

    x_pos, y_pos = size
    @tiles = Array.new(x_pos){ Array.new(y_pos) {} }
    
    @tiles.each_with_index do |row, row_index|
      y_pos.times do |col_index|
        row[col_index] = Tile.new([row_index, col_index], self)
      end
    end
    
    seed_bombs(num_of_bombs)
  end
  
  def seed_bombs(num_of_bombs)
    #randomly seed bomb tiles
    placed_bombs = 0
    while placed_bombs < num_of_bombs
      x = rand(@size.first)
      y = rand(@size.last)
      if @tiles[x][y].bomb == false
        @tiles[x][y].bomb = true
        placed_bombs += 1
      end
    end
  end
  
  def select_tile(pos)
    self.tiles[pos.first][pos.last]
  end
  
  def draw_top_margin
    @size.first.times { |num| print "#{num} " }
  end
  
  def draw_board
    # self.draw_top_margin
    (0...@size.first).each do |y|
      (0...@size.last).each do |x|
        print @tiles[x][y].display
        print "\u25E6"
      end
      print "\n"
    end
  end
  
  def bombed?
    @tiles.each do |row|
      row.each do |tile|
        return true if tile.bomb && tile.checked
      end
    end
    false
  end
  
  def find_bombs
    location = []
    @tiles.each do |row|
      row.each do |tile|
        location << tile.position if tile.bomb
      end
    end
    location
  end
  
  def reveal(position)
    
    revealed_tile = self.select_tile(position)
    
    return 0 if revealed_tile.checked
    revealed_tile.checked = true unless revealed_tile.bomb
    return nil if revealed_tile.bomb
    
    neighbors = revealed_tile.neighbors
    
    # will show all 'empty' tiles
    if neighbors.all?{ |tile| tile.bomb == false && tile.flag == false }
      neighbors.each { |tile| reveal(tile.position) }
    end
    
    neighbor_bombs(revealed_tile, neighbors)
  end
  
  def neighbor_bombs(revealed_tile, neighbors)
    
    # will change display to number of bombs nearby
    neighbor_bombs = 0
    neighbors.each do |tile|
      neighbor_bombs += 1 if tile.bomb
    end
    if neighbor_bombs > 0
      revealed_tile.display = neighbor_bombs
    else
      revealed_tile.display = " "
    end
  end
  
  def valid_tile?(pos)
    x,y = pos
    (0..@size[0]).cover?(x) && (0..@size[1]).cover?(y)
  end
  
end
