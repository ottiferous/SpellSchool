class HumanPlayer

  def initialize
    @secret_word_length = 0
  end

  def choose_word

    puts "How long is the word you are thinking about?"
    loop do
      print "> "
      @secret_word_length = gets.chomp.to_i

      break if @secret_word_length > 0

      puts "Try using a number instead."
    end

    @secret_word_length
  end

  def guess_letter(input)
    gets.chomp
  end

  def find_match(input)
    puts "Where were the letters, press enter if no match?"

    match_positions = 0
    loop do
      match_positions = gets.chomp.split.map(&:to_i)
      break if match_positions.all? { |number| (1..@secret_word_length).include? number }

      puts "Please choose a number between 1 and #{@secret_word_length}"
    end

    #adjust for human-centric letter placement
    match_positions.map { |num| num - 1 }
  end
end
