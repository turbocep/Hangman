

#Getting random guess word
def get_random_word()
  file_path = 'guess_words.txt'
  File.readlines(file_path).map(&:chomp).sample
end

#Obstruct guess word for player based on their guessed letters.
def obstruct_guess_word(guess_word, tried_letters)
  guess_word.split("").map do |letter|
    if tried_letters.include?(letter)
      letter
    else
      "_"
    end
  end.join(" ")
end

#Variables
user_input = ''
round = 0
letters_tired = []
wrong_guesses_left = 7
guess_word = ""
game_saves = {
  save1: {round: 0, letters_tried: [], wrong_guesses_left: 7},
  save2: {round: 3, letters_tried: ['a', 'b', 'c'], wrong_guesses_left: 6}
}



#Welcome Screen
puts "Welcome to Hangman!"
loop do
  puts "<< Enter 'n' to start new game or 'l' to load a saved game:"
  user_input = gets.downcase.chomp
  break if ['n', 'l'].include?(user_input)
  puts "Invalid input. Try again."
end

if user_input == 'n'
  puts 'Creating new game'
  begin
    puts 'Combobulating guess word.'
    guess_word = get_random_word()
  rescue
    puts 'Something went wrong. Trying again.'
    retry
  end
  puts 'Guess word combobulated!'
elsif user_input == 'l'
  puts "Saved Games:"
  puts 'Index   Save name'
  #List the saves. Store as hashes in JSON file. Save index, save name and the saved variables. 

else
  puts "Something went wrong."
end







#Paths
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
  puts guess_word
  puts "Letters tried: #{letters_tried.join(" ")}"
  puts "Wrong guesses left: #{wrong_guesses_left}"
  puts 'ERROR. Insufficient budget for hangman graphics support. Get a job!'
  obstructed_word = obstruct_guess_word(guess_word, letters_tried)
  puts "Guess word: #{obstructed_word}"
  if obstructed_word.split(" ").join == guess_word
    puts "Game over. You won!"
    break
  end
  puts "Enter guess letter or 'quit' to quit game:"
  guess = gets.chomp
  letters_tried.push(guess)
  
end




