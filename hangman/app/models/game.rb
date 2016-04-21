class Game
  include ActiveModel::AttributeMethods, ActiveModel::Serializers::JSON

  class GameOverError < StandardError; end

  MAX_FAILED_ATTEMPTS = 5

  attr_accessor :word

  attr_accessor :selected_letters


	def initialize
  		#@letters = ("a".."z").to_a
        #@guesses = 18
    
        # Input all words into the dictionary
        #@dict = Set.new
        #File.foreach("#{Rails.root}/dictionary.txt") {|w| @dict.add w.chomp}
        
        # Pick a word length and limit the dictionary to words of that length
        #@word = rand(4..8).times.map {false}
        #@dict.reject! {|w| w.length != @word.length}


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

  	def attempts
  		selected_letters.size
  	end

  	def guessed?
  		(word.split('') - selected_letters).empty?
	    #@word.count false == 0
	end
	    
	    def finished?
	        guessed? or attempts >= 10
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

 			#@letters.delete letter
	        #@pattern, @dict = *dict.classify {|word| word.split(//).map {|l| l == letter}}.max_by {|p, set| set.size}
	        #@word = @word.zip(pattern).map {|a, b| (not a and b)? guess : a}
	        #@guesses += 1
	        #@pattern = pattern_string
  			selected_letters << letter unless selected_letters.include? letter
 		 	word.include? letter
 		 	@guesses +=1
		end

		def pattern_string
	        @word.map {|letter| if letter then letter else "_" end}.join " "
	    end



end