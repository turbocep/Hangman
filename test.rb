#Test for importing the JSON file.
puts require 'json'

file1 = File.read('./saves.json')
p file1
file = JSON.parse(file1)
p file
