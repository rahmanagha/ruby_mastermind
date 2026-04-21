class ComputerPlayer
  
  include Evaluatable

  def initialize
    @all_codes = generate_all_codes
    @possible_codes = @all_codes.dup
    @last_guess = nil
  end
  def get_guess
    @last_guess = pick_guess
    @last_guess
  end

  def pick_guess
    return [1,1,2,2] if @last_guess == nil
    lowest_worst_case = 1296
    best_guess = nil
    @possible_codes.each do |possible_guess|
      score = worst_case_remaining(possible_guess)
      if score <= lowest_worst_case
        lowest_worst_case = score
        best_guess = possible_guess
      end
    end
    best_guess
  end

  def receive_feedback(guess, feedback)
    @possible_codes.select! {|possible_code| evaluate(possible_code, guess) == feedback}
  end

  private

  def worst_case_remaining(guess)
    possible_responses_count = Hash.new(0)
    @possible_codes.each do |secret|
      response = evaluate(secret, guess)
      possible_responses_count[[response[:perfect_match], response[:color_match]]]+=1
    end
    possible_responses_count.values.max
  end

  def generate_all_codes
    digits = [1, 2, 3, 4, 5, 6]
    digits.product(digits, digits, digits)
  end
end