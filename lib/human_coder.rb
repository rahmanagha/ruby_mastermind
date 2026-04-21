require_relative "input_handler"
require_relative "evaluatable"
require_relative "validatable"

class HumanCoder
  
  attr_reader :secret
  
  include InputHandler
  include Validatable
  include Evaluatable

  def initialize
    @secret = nil
  end

  def get_secret
    @secret = get_input
  end

  def evaluate_code(guess)
    return false unless valid_input?(guess)
    evaluate(@secret, guess)
  end
end