#Store graphics as an array
#Join graphics into string
#Split graphics based on "Round"
#Ensure newlines are added properly.

path = './hangman_graphics.txt'
file = File.readlines(path)
new_file = file.join.split("Turn\n")
new_file.shift
puts new_file