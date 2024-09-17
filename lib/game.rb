#Components of Game:
#Guess word
#Letters tried
#Guesses left

#Getting random guess word
file_path = 'guess_words.txt'
GUESS_WORD = File.readlines(file_path).map(&:chomp).sample

tried_letters = []


#Should probably turn into method to call more easily.
def obstruct_guess_word(guess_word, tried_letters)
  GUESS_WORD.split("").map do |letter|
    if tried_letters.include?(letter)
      letter
    else
      "_"
    end
  end.join(" ")
end

puts GUESS_WORD
puts obstruct_guess_word(GUESS_WORD, tried_letters)
#I could use classes and then display the guess word based on methods (like SSN)

#Let's just make the basic thing first. 




