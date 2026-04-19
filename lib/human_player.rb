require_relative "validatable"

class HumanPlayer

  include Validatable

  def check_guess(string)
    converted_array = string.split("").map {|number| number.to_i}
    return converted_array if valid_guess?(converted_array)
    false
  end

  def get_guess
    puts "Enter 4 digits (1-6), e.g., 1234"
    loop do
      guess = check_guess(gets.chomp)
      break unless guess == false
      puts "Please enter a valid guess!"
    end
    guess
  end
end