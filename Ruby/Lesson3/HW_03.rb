###############################################################################
#
# Introduction to Ruby on Rails
#
# Homework 03
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# is to help you better understand Arrays, Hashes and Loops that we
# learned in Lesson 03.
#
###############################################################################
#
# 1. Review your solution to Lab 02. Copy and Paste your solution to
#    this file.
#
# 2. Create a new Array variable called `set_of_numbers`, this will be
#    a range between 1 - 10 that our Player will guess from. Each value
#    in the Array should be an integer.
#
# 3. Change the variable `secret_number` (HW_02) so that instead of a hard-coded
#    Integer, it randomly chooses one of the options from `set_of_numbers`
#    ('secret_number' is the integer our Player will try to guess).
#
#      Hint: Look up Array#sample in the Ruby documentation.
#
# 4. Create a new Hash variable called `messages`. In this Hash will be
#    four Keys Value pairs:
#
#    1. :win - A String telling the Player that they have won.
#
#    2. :lose - A String telling the Player that they have lost and what
#       the correct number was.
#
#    3. :too_low - A String telling the Player that their guess was too
#       low.
#
#    4. :too_high - A String telling the Player that their guess was too
#       high.
#
# 5. Change the behavior of your program, so instead of hard coding, use the principles of DRY(don't repeat yourself). 
#    This means using a Loop to iterate over your code either until the Player has guessed the
#    correct number, or they have tried to guess 3 times.
#
# 6. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
#Put your solution below this line.
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

# Looping it through
guesses_left = 3
guesses = 0

3.times do 
	puts "Enter your guess"
	guess = $stdin.gets.chomp.to_i
	guesses_left -= 1
	guesses += 1
	if guess == secret_number
		puts "#{message[:win]}"
		exit
	elsif guesses == 3
		puts "#{message[:lose]}"
	elsif guess < secret_number
		puts "#{message[:too_low]} You have #{guesses_left} guesses left."
	elsif guess > secret_number
		puts "#{message[:too_high]} You have #{guesses_left} guesses left."
	end

end
