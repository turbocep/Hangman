#Components of Game:
#Guess word
#Letters tried
#Guesses left

#Getting random guess word
file_path = 'guess_words.txt'
GUESS_WORD = File.readlines(file_path).map(&:chomp).sample




