require_relative "code"
require_relative "human_player"


class Game
  
 def play
  turn = 0
  code = Code.new
  human = HumanPlayer.new

  until turn == 12
    puts "Turn #{turn+1}/12"
    guess = human.get_guess
    feedback = code.evaluate(guess)
    if feedback[:perfect_match] == 4
      puts "Congratulations! You guessed correctly"
      puts "The secret was: #{Code.numbers_to_colors(code.secret).join(', ')}"
      break
    end
    puts "Perfect matches: #{feedback[:perfect_match]}, Color matches: #{feedback[:color_match]}"
     turn+=1
  end
  unless feedback[:perfect_match] == 4
    puts "You've run out of turns. The secret code was: #{Code.numbers_to_colors(code.secret).join(', ')}"
  end
 end

end