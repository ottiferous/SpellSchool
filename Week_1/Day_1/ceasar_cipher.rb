# handles shifts of arbitrary length

def caesar word, shift

   letter_cipher = Hash.new
   ("a".."z").each_with_index do |letter, index|
      letter_cipher[letter] = index+1
   end
   number_cipher = letter_cipher.invert

   result = []

   word.split('').each do |letter|

      number = letter_cipher[letter] + shift

      if number > letter_cipher.length
         number = letter_cipher[letter] + shift - (letter_cipher.length * shift / letter_cipher.length)
      end

      result << number_cipher[number]
   end

   result.join('')

end