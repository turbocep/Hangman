#Components of Game:
#Guess word
#Letters tried
#Guesses left

#Getting random guess word
file_path = 'guess_words.txt'
GUESS_WORD = File.readlines(file_path).map(&:chomp).sample

tried_letters = []


guess_word_visual = GUESS_WORD.split("").map do |letter|
  if tried_letters.include?(letter)
    letter
  else
    "_"
  end
end.join(" ")

p guess_word_visual
#I could use classes and then display the guess word based on methods (like SSN)

#Let's just make the basic thing first. 




