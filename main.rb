require_relative "lib/game"

puts "=" * 50
puts "Welcome to Mastermind!"
puts "=" * 50
puts
puts "The computer has created a secret code consisting of 4 colors."
puts "Available colors:"
puts "  1 = red"
puts "  2 = green"
puts "  3 = blue"
puts "  4 = yellow"
puts "  5 = white"
puts "  6 = black"
puts
puts "You have 12 turns to guess the code."
puts "After each guess, you'll receive feedback:"
puts "  • Perfect matches: correct color in the correct position."
puts "  • Color matches: correct color in the wrong position."
puts
puts "Enter your guess as 4 digits without spaces (e.g., 1234)."
puts "Good luck!"
puts

game = Game.new
game.play