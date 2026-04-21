require_relative "code"
require_relative "human_player"


class Game

  def play
    turn = 0
    code = Code.new
    human = HumanPlayer.new

    until turn == 12
      display_turn(turn)
      guess = human.get_guess
      feedback = code.evaluate_code(guess)
      break if handle_win(code, feedback)
      display_feedback(feedback)
      turn += 1
    end

    handle_loss(code, feedback)
  end

  private

  def display_turn(turn)
    puts "Turn #{turn+1}/12"
  end

  def display_feedback(feedback)
    puts "Perfect matches: #{feedback[:perfect_match]}, Color matches: #{feedback[:color_match]}"
  end

  def won?(feedback)
    feedback[:perfect_match] == 4
  end

  def handle_win(code, feedback)
    if won?(feedback)
      puts "Congratulations! You guessed correctly"
      puts "The secret was: #{Code.numbers_to_colors(code.secret).join(', ')}"
      true
    end
  end

  def handle_loss(code, feedback)
    unless won?(feedback)
      puts "You've run out of turns."
      puts "The secret code was: #{Code.numbers_to_colors(code.secret).join(', ')}"
    end
  end
end