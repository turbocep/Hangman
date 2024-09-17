#Components of Game:
#Guess word
#Letters tried
#Guesses left

#Getting random guess word
file_path = 'guess_words.txt'
GUESS_WORD = File.readlines(file_path).map(&:chomp).sample

#Obstruct guess word for player based on their guessed letters.
def obstruct_guess_word(guess_word, tried_letters)
  GUESS_WORD.split("").map do |letter|
    if tried_letters.include?(letter)
      letter
    else
      "_"
    end
  end.join(" ")
end

letters_tried = []
wrong_guesses_left = 7
round = 0
#Represents what happened the previous move. If 1, you had a correct guess. 0 if wrong. I know this is bad practice. I don't care right now. Creative process.
last_move = 0

loop do
  #Show appropriate hangman graphic.
  #Just write uncompact garbage first (like with writing) and then improve later.
  if round == 0
    puts "New game started!"
  end
  puts "Letters tried: #{letters_tried.join(" ")}"
  puts "Wrong guesses left: #{wrong_guesses_left}"
  puts 'ERROR. Insufficient budget for hangman graphics support. Get a job!'
  puts "Guess word: #{obstruct_guess_word(GUESS_WORD, letters_tried)}"
  puts "Enter guess letter or 'quit' to quit game:"
  guess = gets.chomp
  letters_tried.push(guess)
end




