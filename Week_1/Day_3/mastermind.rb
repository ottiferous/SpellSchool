class Game

  attr_accessor

  def initialize
    @solution = Code.new
    @player   = Code.new

    @solution.random_code
  end

  def play
    turns = 0
    # looping and getting input
    puts " welcome to the game! "
    while turns < 11 && !(self.won?)

      @player.code = self.get_user_guess
      string_response = @solution.response @player.code

      puts string_response
      turns += 1
    end

    # We have now won or lost
    if self.won?
      puts "Congratulations you won! In #{turns} turns."
    else
      puts "Sorry you lost.\n The correct answer was #{@solution.code}."
    end

  end

  def get_user_guess
    puts "Type out your code:"
    code = gets.chomp
    # maybe add in verification?
    code.upcase!
    code.split.map(&:to_sym)
  end

  def won?
    @player.code == @solution.code
  end

end

class Code

  attr_accessor :code

  def initialize
    @code     = []
    @colors   = (%w|R G B Y O P|).map(&:to_sym)

  end

  def random_code
    self.code = @colors.sample 4

    self
  end

  def response code
    # unpacks or makes sense of the response hash from Code::response
    # returns a string

    responses = self.check_guess code
    response_string = ""

    responses.each_with_index do |answer, index|

      peg_num = index + 1

      case answer
      when :correct
        response_string += "#{peg_num}: Is Correct\n"
      when :almost
        response_string += "#{peg_num}: Is Almost Correct\n"
      when :wrong
        response_string += "#{peg_num}: Is Wrong\n"
      end

    end
    response_string
  end

  def check_guess code_array

    response = []
    code_array.each_with_index do |guess, index|

      if self.code[index] == guess
        response << :correct
      elsif self.code.include? guess
        response << :almost
      else
        response << :wrong
      end
    end
    response
  end

end
