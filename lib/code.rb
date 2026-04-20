require_relative "validatable"
require_relative "evaluatable"

class Code
  include Validatable
  include Evaluatable

  attr_reader :secret

  COLORS = [nil,"red", "green", "blue", "yellow", "white", "black"]
  
  def initialize
    @secret = Code.random
  end

  def self.random
    secret_code = []
    4.times {secret_code.push(rand(1..6))} 
    secret_code
  end

  def self.numbers_to_colors(numbers)
    numbers.map {|number| COLORS[number]}
  end
  
  def evaluate_code(guess)
    return false unless valid_guess?(guess)
    evaluate(@secret, guess)
  end

end  
