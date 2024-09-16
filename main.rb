#Creating filter for English word file
def filter_by_length(file_path, min_length, max_length)
  words = File.readlines(file_path).map(&:chomp)
  #Is the data stream still open? If so, that MUST be fixed.
  words.select do |word|
    word.length >= min_length && word.length <= max_length
  end
end

filtered_words = filter_by_length('english_test.txt', 5, 12)

p filtered_words


