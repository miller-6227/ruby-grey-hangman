dict = Set.new

File.foreach('dictionary.txt') {|word| dict.add(word)}
guesses = 10
word = rand(4..7).times.map {false}
dict.filter {|w| w.length == word.length}

while guesses > 0 and dict.size > 1
    puts word
    pattern, dict = *dict.classify {|word| word.split(//).map {|l| l == gets.chomp}}.max_by {|p, set| set.size}
    word = word.zip(pattern).map {|a, b| (a or b)? a : false}
    gets -= 1
puts word
