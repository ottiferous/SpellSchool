class ComputerPlayer

  def initialize
    @dictionary = get_dictionary
    @secret_word = ''
    @guessed_letters = []
  end

  def get_dictionary(filename="dictionary.txt")
    @dictionary = File.readlines(filename).map(&:chomp)
  end

  def choose_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def guess_letter(visible_word)

    self.filter_dictionary!(visible_word)

    word = (self.letter_frequency)
    word.delete_if { |key, value| @guessed_letters.include? key }
    guess = word.sort_by{ |k, v| v }.last.first

    @guessed_letters << guess
    puts guess
    guess
  end

  def filter_dictionary!(visible_word)

    bad_guesses = @guessed_letters - visible_word
    target_word_size = visible_word.size
    letter_position_pairs = self.create_letter_pos_pairs(visible_word)


    # reduces dictionary by word length
    # then by removing the letters not in the word
    # then by words that don't have the letter(s) in the right spots
    @dictionary.select! do |word|
      word.size == target_word_size &&
      (bad_guesses & word.split('')).size == 0 &&
      letter_position_pairs.all? { |letter, pos| word[pos] == letter }
    end

  end

  def create_letter_pos_pairs(visible_word)
    letter_position_pairs = []
    visible_word.each_with_index do |letter, index|
      letter_position_pairs << [letter, index] if letter != "_"
    end
    letter_position_pairs
  end

  def letter_frequency
    frequency_table = Hash.new(0)

    ('a'..'z').each do |letter|
      frequency_table[letter] = @dictionary.count { |word| word.include? letter }
    end

    frequency_table
  end

  def find_match(char)
    match_positions = []
    @secret_word.split("").each_with_index do |letter, index|
      match_positions << index if letter == char
    end
    match_positions
  end

end