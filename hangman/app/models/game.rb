class Game
  include ActiveModel::AttributeMethods, ActiveModel::Serializers::JSON

  class GameOverError < StandardError; end

  MAX_FAILED_ATTEMPTS = 5

  attr_accessor :word

  attr_accessor :selected_letters


	def initialize
  		@word = 'Hangman'.upcase
  		@selected_letters = []
  		@guesses = 0
	end

  	def attributes
    	{'word' => nil,
     	'selected_letters' => nil}
  	end

  	def attributes=(hash)
    	hash.each do |key, value|
      	send("#{key}=", value)
    	end
  	end

  	def failed_attempts
  		selected_letters.select { |letter|
    	!word.include?(letter)
  		}.size
  	end

  	def guessed?
	    (word.split('') - selected_letters).empty?
	end
	    
	    def finished?
	        guessed? or @guesses >= 18
	    end
	    
	    def input
	    	guess = params[:letter]
	        if @letters.include? guess then
	            guess = gets.chomp
	            @letters.delete guess
	            pattern, @dict = *dict.classify {|word| word.split(//).map {|l| l == guess}}.max_by {|p, set| set.size}
	            @word = @word.zip(pattern).map {|a, b| (not a and b)? guess : a}
	            @guesses += 1
	            @pattern = pattern_string
	        else
	            puts "error: letter not found"
	        end
	    end	

	    def select!(letter)
 			raise GameOverError if finished?
  			selected_letters << letter unless selected_letters.include? letter
 		 	word.include? letter
		end

		def pattern_string
	        @word.map {|letter| if letter then letter else "_" end}.join " "
	    end



end