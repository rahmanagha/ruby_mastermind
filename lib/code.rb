class Code

  include Validatable

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
  
  def evaluate(guess)
    return false unless valid_guess?(guess)
    response = {perfect_match: 0, color_match: 0}
    response[:perfect_match] = count_perfect_matches(guess)
    edited_guess, edited_secret = remove_perfect_matches(guess)
    response[:color_match] = count_color_matches(edited_guess, edited_secret)
    response
  end

  def count_perfect_matches(guess)
    matches = 0
    guess.each_with_index do |number, index|
      matches+=1 if guess[index] == @secret[index]
    end
    matches
  end

  def count_color_matches(guess,secret)
    matches = 0
    guess.each_with_index do |number, index|
      if secret.include?(number)
        matches+=1
        delete_index = secret.find_index(number)
        secret.delete_at(delete_index)
      end
    end
    matches
  end

  def remove_perfect_matches(guess)
    edited_guess = edit_array(guess, @secret)
    edited_secret = edit_array(@secret, guess)
    [edited_guess, edited_secret]
  end

  def edit_array(edited_array, base_array)
    new_array = []
    edited_array.each_with_index do |number, index|
      new_array.push(number) if number != base_array[index]
    end
    new_array
  end

end  
