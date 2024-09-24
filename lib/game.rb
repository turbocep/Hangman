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

def create_save_hash(name, round, letters_tried, wrong_guesses_left, guess_word)
  {
     "name": name,
     "round": round,
     "letters_tried": letters_tried,
     "wrong_guesses_left": wrong_guesses_left,
     "guess_word": guess_word
  }
end

#Variables
user_input = ''
round = 0
letters_tried = []
wrong_guesses_left = 7
guess_word = ""
save_path = './saves.json'
game_saves = JSON.parse(File.read(save_path))


puts "Welcome to Hangman!"
#Menu Loop
loop do
  #Main Menu
  loop do
    puts "--Main Menu--"
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
    break
  elsif user_input == 'l'
    puts "Saved Games:"
    #Load saved games.
    puts 'Index   Save name'
    game_saves.each_with_index do |game, index|
      puts "  #{index + 1}  => #{game["name"]}"
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
      #Delete selected save
      game_saves.delete(selected_file)
      #Write saves file with save array excluding deleted save
      File.write(save_path, JSON.dump(game_saves))
    elsif user_input == 'l'
      #Loads save game variables
      round = selected_file["round"]
      letters_tried = selected_file["letters_tried"]
      wrong_guesses_left = selected_file["wrong_guesses_left"]
      guess_word = selected_file["guess_word"]
      puts "Resuming game '#{selected_file["name"]}'"
      break
    end
  else
    puts "Something went wrong."
  end
end

loop do
  #Show appropriate hangman graphic.
  #Just write uncompact garbage first (like with writing) and then improve later.
  if round == 0
    puts "New game started!"
  end
  puts guess_word
  letters_tried_formatted = letters_tried.nil? ? "" : letters_tried.join(" ")
  puts "Letters tried: #{letters_tried_formatted}"
  puts "Wrong guesses left: #{wrong_guesses_left}"
  puts "\n\n\n\n\n\n\n\n\n\n\n\n"
  obstructed_word = obstruct_guess_word(guess_word, letters_tried)
  puts "Guess word: #{obstructed_word}"
  if obstructed_word.split(" ").join == guess_word
    puts "Game over. You won!"
    break
  end
  loop do
    puts "Enter guess letter or 'quit' to quit game:"
    guess = gets.chomp.downcase
    if guess == "quit"
      puts "Quitting game"
      break
    elsif letters_tried.include?(guess)
      puts "You've already tried this letter. Try a different one."
    elsif !%w[
      a b c d e f g h i j k l m n o p q r s t u v w x y z
      ].include?(guess)
      puts "Invalid input"
    else
      letters_tried.push(guess)
      round += 1 if guess_word.include?(guess)
      break
    end
  end
  if guess == "quit"
    loop do
      puts ">> Enter 's' to save this game or 'e' to exit immediately:"
      user_input = gets.chomp.downcase
      #How do I make more concise/better user-input loops?
      if user_input == "e"
        break
      elsif user_input == "s"
        loop do
          puts ">> Enter a save name that is between 5 and 20 characters long:"
          user_input = gets.chomp.downcase
          #Save
          if user_input.length >= 5 && user_input.length <= 20
            game_saves.push(create_save_hash(
              user_input, 
              round, 
              letters_tried, 
              wrong_guesses_left, 
              guess_word)
              )
            #Overwrites game save.
            File.write(save_path, JSON.dump(game_saves))
            puts "Game saved as '#{user_input}'"
            break
          end
          puts "Something went wrong. Try again."
        end
      end
  end
end




