# Mastermind

A command‑line implementation of the classic code‑breaking game Mastermind, built with Ruby. Play as the codebreaker against a computer‑generated secret, or watch the computer use Knuth's minimax algorithm to crack your own code in 5 guesses or fewer.

This project is part of [The Odin Project](https://www.theodinproject.com/) Ruby curriculum, demonstrating object‑oriented design, modular architecture, and algorithmic problem‑solving.

## 🎮 Features

- Two game modes:
  - **Human Guesser**: Try to crack a random 4‑color code within 12 turns.
  - **Computer Guesser**: Create a secret code and watch the AI solve it optimally.
- Clean command‑line interface with color legend and turn tracking.
- Input validation for both guesses and secret codes.
- Optimal AI using Donald Knuth's five‑guess minimax algorithm.
- Replay option to start a new game without restarting the program.

## ▶️ How to Play

1. **Clone the repository**

```bash
   git clone https://github.com/rahmanagha/ruby_mastermind.git
   cd ruby_mastermind
```

2. **Ensure Ruby is installed**

   This project requires Ruby 2.7 or higher.
  
   `ruby --version`
   
3. **Run the game**

   `ruby main.rb`

4. **Choose a game mode**

   - 1 – You guess the computer's secret code.
   - 2 – You create a secret code and the computer guesses.

5. **Enter codes as 4 digits (1‑6)**   

   Colors are mapped to numbers:
```
   Number           Color

   1                Red

   2                Green

   3                Blue

   4                Yellow

   5                White

   6                Black
```

6. **Receive feedback after each guess**

   - Perfect matches: Correct color in the correct position.
   - Color matches: Correct color in the wrong position.

Use the feedback to deduce the secret code before you run out of turns.

7. **Play again – After each game, you'll be prompted to start a new round.**

## 📁 Project Structure

```
   ruby_mastermind/
   ├── .prettierignore
   ├── lib/
   │   ├── code.rb              # Random secret generation & evaluation
   │   ├── computer_player.rb   # AI guesser using Knuth's minimax
   │   ├── evaluatable.rb       # Shared scoring logic (perfect/color matches)
   │   ├── game.rb              # Game orchestration and dual‑mode support
   │   ├── human_coder.rb       # Human secret creation (mode 2)
   │   ├── human_player.rb      # Human guesser (mode 1)
   │   ├── input_handler.rb     # Shared input prompting & validation
   │   └── validatable.rb       # Guess/input validation rules
   ├── main.rb                  # Entry point with mode selection & replay loop
   ├── LICENSE
   └── README.md
```

## 🛠️ Built With

   - Ruby – A dynamic, open‑source programming language with a focus on simplicity and productivity.

## 🚀 Future Enhancements

   - Add an AI opponent using minimax algorithm
   - Add colored output for better readability
   - Write RSpec tests for core game logic

## 📝 License

    This project is open source and available under the MIT License.