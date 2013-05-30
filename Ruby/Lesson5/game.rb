class Game
#	Make sure that all the instance variables in this class may only be READ and not WRITTEN to. 
  attr_reader :guesses_allowed, :current_guess_count, :current_guess

  @@messages =   { win: "You won!",
                   lose:  "You lost! :-(",
                   too_low: "Your guess was too low!",
                   too_high: "Your guess was too high!" }


	# Initializes The number of guesses (or tries) a player is allowed before the game ends.
	# You should default number of guesses to 3 if the parameter is null.
	# Sets a guess counter to zero.
	# Creates a new instance of the Player class. 
	# Creates a new instance of the SecretNumber class and assigns it to the secret_number. Don't forget to pass along the
	# necessary parameters.
  # initializes the current guess to nil

  def initialize(guesses_allowed=3, set_of_numbers)
      @guesses_allowed = guesses_allowed
      @current_guess_count = 0

      #Initializing player
      @player = Player.new
      #Initializing secret number
      @secret_number = SecretNumber.new(set_of_numbers)
      
      @current_guess = nil

  end

  # Print who made this wonderful program :-)
  def print_created_by
      puts "Created by: Eric Lee"

  end
  

	# Calls `print_created_by` so that your players knows you created the game.
	# Asks the player to enter his/her name. Save it to @player.name.
	# Print out the number of guesses the players gets and the range of numbers they can choose from.
	# Asks the player for his/her guess. Use the `guess_correct?` method to verify the guess.
	# Continue to ask the user to guess the number so long as they have not maximized the number of guesses allowed 
	# and they did not guess correctly. 
  # Each time tell the player how many guesses left they have.
	# If at the end of the loop they still did not guess correctly, tell the player that they have lost using the
	# `@@messages` class variable and tell them the secret number.
  def start_game
      print_created_by
      puts "What is your name?"
      @player.name = $stdin.gets.chomp
      puts "#{@player.name.upcase} you have #{@guesses_allowed} guesses."
      puts "Guess a number between #{@secret_number.set_of_numbers}"

      while @current_guess_count < @guesses_allowed
          puts "Enter your guess"
          @current_guess = $stdin.gets.chomp.to_i
          increment_guess_count
          guess_correct?(@current_guess) 
      end

      puts "#{@@messages[:lose]}"
      puts "The secret number is " + "#{@secret_number.num}"

  end



	# This method checks if the player guessed the correct secret number. 
  # It shoudl print out if they guessed correctly or guessed too high or too low.
	# Use the `@@messages` Hash to display this feedback.
	# Also let the player know how many guesses they have left.
	# If the guess is correct, make sure to return true, otherwise return false.
  def guess_correct?(guess)

      if guess == @secret_number.num
        puts "#{@@messages[:win]}"
        return true   
      elsif guess < @secret_number.num
        puts "#{@@messages[:too_low]}"
        return false
      elsif guess > @secret_number.num
        puts "#{@@messages[:too_high]}"
        return false
      end
  end


  # This method should increment every time the player guesses incorrectly.
  def increment_guess_count
      @current_guess_count += 1
  end
  

  # Calculates the guesses the player has left.
  def guesses_left  
      @guesses_allowed - @current_guess_count
  end
end

