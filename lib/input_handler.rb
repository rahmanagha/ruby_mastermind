require_relative "validatable"

module InputHandler

  include Validatable

  def check_input(string)
    converted_array = string.split("").map {|number| number.to_i}
    return converted_array if valid_input?(converted_array)
    false
  end
  
  def get_input 
    puts "Enter 4 digits (1-6), e.g., 1234"
    loop do
      input = check_input(gets.chomp)
      return input if input   # Returns the array directly when valid
      puts "Please enter a valid input!"
    end
  end
end