require 'set'

dict = Set.new

File.foreach('dictionary.txt') {|word| dict.add(word.chomp)}
guesses = 18
letters = ("a".."z").to_a
word = rand(4..7).times.map {false}
dict.reject! {|w| w.length != word.length}

while guesses > 0 do
    puts "\n"
    puts word.map {|letter| if letter then letter else "_" end}.join " "
    puts "Size: #{dict.size} Guesses left: #{guesses}"
    puts "Available letters: #{letters.join " "}"
    puts "Enter guess: "

    guess = gets.chomp
    letters.delete guess
    pattern, dict = *dict.classify {|word| word.split(//).map {|l| l == guess}}.max_by {|p, set| set.size}
    word = word.zip(pattern).map {|a, b| (not a and b)? guess : a}
    guesses -= 1
end

dict.each {|w| puts w}
