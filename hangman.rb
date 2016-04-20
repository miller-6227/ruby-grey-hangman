require 'set'

class Game
  include ActiveModel::AttributeMethods, ActiveModel::Serializers::JSON

  class GameOverError < StandardError; end
      
    def initialize
        @letters = ("a".."z").to_a
        @guesses = 18
    
        # Input all words into the dictionary
        @dict = Set.new
        File.foreach('dictionary.txt') {|w| @dict.add w.chomp}
        
        # Pick a word length and limit the dictionary to words of that length
        @word = rand(4..8).times.map {false}
        @dict.reject! {|w| w.length != @word.length}
    end
    
    def guessed?
        @word.count false == 0
    end
    
    def finished?
        guessed? or guesses <= 0
    end
    
    def input(guess)
        if letters.include? guess then
            guess = gets.chomp
            letters.delete guess
            pattern, dict = *dict.classify {|word| word.split(//).map {|l| l == guess}}.max_by {|p, set| set.size}
            word = word.zip(pattern).map {|a, b| (not a and b)? guess : a}
            guesses -= 1
        else
            puts "error: letter not found"
        end
    end
    
    def show
        puts "\n"
        puts word.map {|letter| if letter then letter else "_" end}.join " "
        puts "Size: #{dict.size} Guesses left: #{guesses}"
        puts "Used letters: #{letters.join " "}"
        puts "Enter guess: "
    end
    
end
