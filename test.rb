#Test for importing the JSON file.
puts require 'json'

file1 = File.read('./saves.json')
file = JSON.parse(file1)
p file
file.delete_at(0)
p file
File.write('./saves.json', JSON.dump(file))

