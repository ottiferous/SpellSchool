# Towers of Hanoi

# Create three pegs to move disks
class Hanoi
   def initialize
      @map = {
         1 => [4,3,2,1],
         2 => [],
         3 => []
      }
   end

   def valid_move? from, to
      if @map[from].empty?
         return false
      elsif @map[to].empty? || @map[from].last < @map[to].last
         return true
      end
   end

   def move from, to
      @map[to] << @map[from].pop
   end

   def won?
      @map[1].empty? && @map[2].empty?
   end

   def get_move
      puts "Which peg do you want to move?"
      puts "The game is as follows\n Peg 1: #{@map[1]}\n Peg 2: #{@map[2]}\n Peg 3: #{@map[3]}\n"
      puts "Starting Peg: "
      from = gets.chomp.to_i
      puts "End peg: "
      to = gets.chomp.to_i

      if valid_move? from, to
         return [from, to]
      else
         puts "invalid move, please try again"
         return get_move()
      end
   end


   def prompt_user
      until won?
         from, to = get_move
         move from, to
      end
      puts "Way to go! You won!"
   end
end


