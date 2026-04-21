require_relative "code"
require_relative "human_player"
require_relative "human_coder"
require_relative "computer_player"


class Game

  def play(mode)
    turn = 0

    if mode == 1
      code = Code.new
      human = HumanPlayer.new
      current_player = human
    elsif mode == 2
      code = HumanCoder.new
      code.get_secret
      computer = ComputerPlayer.new
      current_player = computer
    end

    until turn == 12
      display_turn(turn)
      guess = current_player.get_guess
      feedback = code.evaluate_code(guess)
      computer.receive_feedback(guess, feedback) if mode == 2
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
      puts "The guesser has won"
      puts "The secret was: #{Code.numbers_to_colors(code.secret).join(', ')}"
      true
    end
  end

  def handle_loss(code, feedback)
    unless won?(feedback)
      puts "The guesser ran out of turns."
      puts "The secret code was: #{Code.numbers_to_colors(code.secret).join(', ')}"
    end
  end
end