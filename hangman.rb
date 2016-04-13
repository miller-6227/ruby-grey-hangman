dict = Set.new

def pickLargest(guess)
    pair = dict.classify {|word| word.split(//).map {|l| l == letter}}.max_by {|p, set| set.size}
    dict = pair[1]
    pair[o]
end

def play() 
    File.foreach('dictionary.txt') {|word| dict.add(word)}
    guesses = 10
    word = rand(4..7).times.map {false}
    dict.filter
    while guesses > 0 and dict.size > 1
        puts word
        pattern = pickLargest(gets.chomp)
        word = word.zip(pattern).map {|a, b| (a or b)? a : false}
        gets -= 1
    puts word
end
