require 'json'

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
letters_tried = []
wrong_guesses_left = 7
guess_word = ""
game_saves = JSON.parse(File.read('./saves.json'))
puts game_saves



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
  #Load saved games.
  puts 'Index   Save name'
  game_saves.each_with_index do |game, index|
    puts "  #{index + 1}  => #{game_saves[index][:name]}"
  end
  puts "#{game_saves.length}/10 saves made"
  puts '>> Select a save by entering its index:'
  loop do
    user_input = gets.chomp.to_i
    break if user_input > 0 && user_input <= game_saves.length
    puts "Invalid input. Try again."
  end
  #Save Selected
  selected_file = game_saves[user_input - 1]
  puts '>> Enter l to load or d to delete this save'
  loop do
    user_input = gets.chomp.downcase
    break if ['d', 'l'].include?(user_input)
    puts "Invalid input. Try again."
  end
  if user_input == 'd'
    #How do I delete the file from serialization?
  elsif user_input == 'l'
    #Load the new game now.
  end

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




