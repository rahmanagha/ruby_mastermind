module Validatable
  def valid_guess?(guess)
    guess.length == 4 && guess.all? { |n| (1..6).cover?(n) }
  end
end