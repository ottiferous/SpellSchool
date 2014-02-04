class Tile

  attr_accessor :display, :flag, :bomb, :checked, :position

  def initialize(position, board)
    @display = "_"
    @flag = false
    @bomb = false
    @checked = false
    @position = position
    @board = board
  end

  def neighbors
    neighbor_array = []
    (-1..1).each do |x_offset|
      (-1..1).each do |y_offset|
        #cuz it's the same dude
        next if x_offset.zero? && y_offset.zero?
        neighbor_coords = []
        neighbor_coords << @position[0] + x_offset
        neighbor_coords << @position[1] + y_offset
        neighbor_array << neighbor_coords
      end
    end

    real_neighbors = []
    @board.tiles.each do |row|
      real_neighbors += row.select { |tile| neighbor_array.include?(tile.position) }
    end

    real_neighbors
  end

end