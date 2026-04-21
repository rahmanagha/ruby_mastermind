require_relative "lib/game"

puts "=" * 50
puts "Welcome to Mastermind!"
puts "=" * 50
puts

loop do
  puts "Choose a game mode:"
  puts "  1 - You guess the computer's secret code"
  puts "  2 - Computer guesses your secret code"
  puts
  print "Enter 1 or 2: "
  mode = gets.chomp.to_i

  until mode == 1 || mode == 2
    puts "Invalid choice. Please enter 1 or 2."
    print "Enter 1 or 2: "
    mode = gets.chomp.to_i
  end

  puts
  puts "Available colors:"
  puts "  1 = red"
  puts "  2 = green"
  puts "  3 = blue"
  puts "  4 = yellow"
  puts "  5 = white"
  puts "  6 = black"
  puts

  if mode == 1
    puts "The computer has created a secret code. You have 12 turns to guess it."
    puts
    puts "After each guess, you'll receive feedback:"
    puts "  • Perfect matches: correct color in the correct position."
    puts "  • Color matches: correct color in the wrong position."
    puts
    puts "Enter your guess as 4 digits without spaces (e.g., 1234)."
  else
    puts "You will create a secret code, and the computer will try to guess it in 12 turns."
    puts "Enter your secret code as 4 digits without spaces (e.g., 1234)."
  end

  puts "Good luck!"
  puts

  game = Game.new
  game.play(mode)

  puts
  print "Play again? (y/n): "
  answer = gets.chomp.downcase
  break unless answer == "y"
  puts
end

puts "Thanks for playing!"