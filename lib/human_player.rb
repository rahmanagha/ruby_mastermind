require_relative "input_handler"

class HumanPlayer

  include InputHandler

  def get_guess
    get_input
  end
end