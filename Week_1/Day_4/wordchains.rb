class WordChains
  attr_accessor :file

  def initialize
    @file = File.readlines('dictionary.txt').map(&:chomp)
  end

  ##############################################
  # an alternate way to do the below - need to #
  # be tested more before releasing it into a  #
  # real working class method
  ##############################################

  # def one_different_char?(str, other)
  #   other_str = other.dup
  #   str.chars{|char| other_str.sub!(char, '')} 
  #   other_str.size == 1
  # end    

  def adjacent_helper(word, dictionaryword)
    (0...word.length).each do |ind|
      word1 = word.dup
      dictionary1 = dictionaryword.dup
      word1[ind] = "."
      dictionary1[ind] = "."
      if word1 == dictionary1
        return true
      end
    end
    false    
    
  end


  def adjacent_words(word, dictionary)
    dictionary.select do |dictionary_word|
      adjacent_helper(word, dictionary_word)
    end
  end

  def explore_words(source)
    @words_to_expand = [source]
    @candidate_words = @file.select { |words| words.length == source.length }
    @all_reachable_words = [source]

    until @words_to_expand.empty?
      proper_adjacent_words = adjacent_words(@words_to_expand.shift, @candidate_words)
      p @words_to_expand.length
      @candidate_words -= proper_adjacent_words
      @words_to_expand += proper_adjacent_words
      @all_reachable_words += proper_adjacent_words
    end
    @all_reachable_words
  end

  def find_chain(source, target)
    @words_to_expand = [source]
    @candidate_words = @file.select { |words| words.length == source.length }
    @parent = {}

    until @words_to_expand.empty?
      new_word = @words_to_expand.shift
      proper_adjacent_words = adjacent_words(new_word, @candidate_words)
      proper_adjacent_words.each do |word1| @parent[word1] = new_word end
      @candidate_words -= proper_adjacent_words
      @words_to_expand += proper_adjacent_words
      return nil if new_word == target
    end
    @parent
  end

  def backtrace(source,target)
    find_chain(source, target)
    ar = [target]
    while true
      target = @parent[target]
      ar << target
      if target == source

        break
      end

    end

    ar.reverse

  end

end