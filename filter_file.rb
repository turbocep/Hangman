#Method: Filter a text file of words by length constraints.
def filter_by_length(file_path, min_length, max_length)
  words = File.readlines(file_path).map(&:chomp)
  #Is the data stream still open? If so, that MUST be fixed.
  words.select do |word|
    word.length >= min_length && word.length <= max_length
  end
end

#Options:
file_path = 'google-10000-english-no-swears.txt'
min_length = 5
max_length = 12

filtered_words = filter_by_length(file_path, min_length, max_length)

#Writing filtered words to the file:
File.open('guess_words.txt', 'w') do |f|
  filtered_words.each {|word| f.write(word + "\n")}
end
