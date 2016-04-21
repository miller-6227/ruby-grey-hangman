class Game
  include ActiveModel::AttributeMethods, ActiveModel::Serializers::JSON


  MAX_FAILED_ATTEMPTS = 5

  attr_accessor :word

  attr_accessor :selected_letters


	def initialize
  		#@letters = ("a".."z").to_a
        #@guesses = 18
    
        # Input all words into the dictionary
        @dict = []
        File.foreach("#{Rails.root}/dictionary.txt") {|w| @dict.concat([w.chomp])}
        
        # Pick a word length and limit the dictionary to words of that length
        #@word = rand(4..8).times.map {false}
        #@dict.reject! {|w| w.length != @word.length}


  		@word = @dict.shuffle!.first.upcase
  		@selected_letters = []
  		@guesses = @word.length
	end

	def guessesAllowed
		@word.length
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
	    
	end
	    
	    def finished?
	        guessed? or failed_attempts >= word.length
	    end

	    def select!(letter)

 		
  			selected_letters << letter unless selected_letters.include? letter
 		 	word.include? letter
		end

		def pattern_string
	        @word.map {|letter| if letter then letter else "_" end}.join " "
	    end



end