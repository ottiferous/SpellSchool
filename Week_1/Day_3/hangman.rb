load 'human_player.rb'
load 'computer_player.rb'

class Game

  def initialize
    @current_word = ["_"]
    @thinker
    @guesser
  end

  def play
    puts "Welcome to Hangman"
    puts "Which game do you want to play?"
    puts "1. The computer guesses a word of your choosing."
    puts "2. You are the guesser and the computer will choose a word."
    game_mode(gets.chomp)

    word_length = @thinker.choose_word
    blank_current_word(word_length)

    while @current_word.include?("_")

      self.print_word
      guess = @guesser.guess_letter(@current_word)

      positions = @thinker.find_match(guess)
      self.update_current_word(positions, guess)
    end

    puts "You win! You guessed the word: #{@current_word.join}"
  end

  def game_mode choice

    if choice == "1"
      @thinker = HumanPlayer.new
      @guesser = ComputerPlayer.new
    else
      @thinker = ComputerPlayer.new
      @guesser = HumanPlayer.new
    end

    nil
  end


  def print_word
    puts "Secret word: #{@current_word.join('.')}"
    print "> "
  end

  def blank_current_word number
    @current_word = ["_"] * number
  end

  def update_current_word(pos, letter)
    pos.each do |p|
      @current_word[p] = letter
    end

    nil
  end
end