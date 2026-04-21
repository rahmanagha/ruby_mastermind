module Evaluatable
  def evaluate(secret, guess)
    response = {perfect_match: 0, color_match: 0}
    response[:perfect_match] = count_perfect_matches(secret, guess)
    edited_guess, edited_secret = remove_perfect_matches(secret, guess)
    response[:color_match] = count_color_matches(edited_guess, edited_secret)
    response
  end

  private

  def count_perfect_matches(secret, guess)
    matches = 0
    guess.each_with_index do |number, index|
      matches+=1 if guess[index] == secret[index]
    end
    matches
  end

  def remove_perfect_matches(secret, guess)
    edited_guess = edit_array(guess, secret)
    edited_secret = edit_array(secret, guess)
    [edited_guess, edited_secret]
  end

  def count_color_matches(secret, guess)
    secret_copy = secret.dup
    matches = 0
    guess.each_with_index do |number, index|
      if secret_copy.include?(number)
        matches+=1
        delete_index = secret_copy.find_index(number)
        secret_copy.delete_at(delete_index)
      end
    end
    matches
  end

  def edit_array(edited_array, base_array)
    new_array = []
    edited_array.each_with_index do |number, index|
      new_array.push(number) if number != base_array[index]
    end
    new_array
  end

end