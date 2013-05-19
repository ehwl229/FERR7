###############################################################################
#
# Introduction to Ruby on Rails
#
# Lab 04
#
# Purpose:
#
# Read the steps below and complete the exercises in this file. This Lab
# will help you to review the basics of Object-Oriented Programming that
# we learned in Lesson 04.
#
###############################################################################
#
# 1. Review your solution to Lab 03. Copy and Paste your solution to
#    this file.
#
# 2. Create a new method called `increment_guess_count` that takes
#    an integer parameter and increments it by 1.
#
# 3. Create a new method called `guesses_left` that calculates how many guesses 
#	 out of 3 the Player has left. The method should take one parameter that is the 
#	 number of guesses the player has guessed so far. Use this new method in your 
#	 code to tell the user how many guesses they have remaining. 
#
# 4. Make sure to remove your local variable `guesses_left` and use the
#    new method instead.
#
# 5. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
# Student's Solution
#
###############################################################################

# Intro
puts "Hello! Welcome to the Secret Number Game. Created by: Eric Lee"

puts "What's your name?"
player_name = $stdin.gets.chomp.upcase

# Explains the Secret Number Game
puts "Hi #{player_name}. Guess a number between 1 and 10."
puts "You have 3 guesses."

# Randomly Picking Secret Number
set_of_numbers = [1,2,3,4,5,6,7,8,9,10]
secret_number = set_of_numbers.sample

# Creating Messages Hash
message = {
	win: "You've guessed the secret number!",
	lose: "You lose. The secret number is #{secret_number}.",
	too_high: "Oops, wrong number. Guess lower.",
	too_low: "Oops, wrong number. Guess higher.",
}

# Methods 
current_guess_count = 0

def increment_guess_count(current_guess_count)
	current_guess_count += 1
end

def guesses_left(current_guess_count)
	3 - current_guess_count
end


# Looping it through
3.times do 
	puts "Enter your guess"
	guess = $stdin.gets.chomp.to_i
	current_guess_count = increment_guess_count(current_guess_count)
	if guess == secret_number
		puts "#{message[:win]}"
		exit
	elsif current_guess_count == 3
		puts "#{message[:lose]}"
	elsif guess < secret_number
		puts "#{message[:too_low]}"
		puts "You have #{guesses_left(current_guess_count)} left."
	elsif guess > secret_number
		puts "#{message[:too_high]}"
		puts "You have #{guesses_left(current_guess_count)} left."
	end

end


