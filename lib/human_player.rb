require_relative "validatable"

class HumanPlayer

  include Validatable

  def check_guess(string)
    converted_array = string.split("").map {|number| number.to_i}
    return converted_array if valid_input?(converted_array)
    false
  end

  def get_guess
    puts "Enter 4 digits (1-6), e.g., 1234"
    loop do
      guess = check_guess(gets.chomp)
      return guess if guess   # Returns the array directly when valid
      puts "Please enter a valid guess!"
    end
  end
end