class Hangman
  attr_accessor :categories, :lives

  def initialize(categories, max_lives = 5)
    @categories = categories
    @lives = max_lives
    @max_lives = max_lives
  end

  def choose_random_category
    category = @categories.keys.sample
    word = @categories[category].sample
    [category, word]
  end

  def play_round(level)
    category, guess_word = choose_random_category
    guessed_letters = ["_"] * guess_word.length
    guessed_set = []

    puts "\nWelcome to Hangman - Level #{level}!"
    puts "The word is from the category: #{category.capitalize}"
    puts "Guess the letters in the word!"

    while @lives > 0
      puts "\nYou have #{@lives} lives left."
      puts guessed_letters.join(" ")
      print "Enter a letter: "
      guess_letter = gets.chomp.downcase

      # Validate input
      if guess_letter.length != 1 || !guess_letter.match?(/[a-z]/)
        puts "Enter a single valid letter."
        next
      end

      if guessed_set.include?(guess_letter)
        puts "You've already guessed that letter!"
        next
      end

      guessed_set << guess_letter

      if guess_word.include?(guess_letter)
        # Update guessed_letters for correct guesses
        guess_word.chars.each_with_index do |char, index|
          guessed_letters[index] = char if char == guess_letter
        end
        puts "Good guess!"
      else
        @lives -= 1
        puts "Wrong guess!"
      end

      # Check if the player has guessed the entire word
      if guessed_letters.join("") == guess_word
        puts guessed_letters.join(" ")
        puts "Congratulations! You won this level! The word was '#{guess_word}'."
        # Remove word from category to avoid repetition
        @categories[category].delete(guess_word)
        return true
      end
    end

    false
  end

  def start_game
    (1..5).each do |level|
      puts "\nLevel #{level}"
      success = play_round(level)

      break if @lives == 0

      unless success
        puts "You failed Level #{level}."
        break
      end
    end

    if @lives > 0
      puts "Congratulations! You completed the game with #{@lives} lives remaining!"
    else
      puts "Game over! You ran out of lives."
    end
  end
end

# Categories and their word lists
categories = {
  "fruits" => ["apple", "banana", "cherry", "mango", "orange"],
  "animals" => ["tiger", "elephant", "zebra", "giraffe", "kangaroo"],
  "countries" => ["india", "brazil", "canada", "germany", "japan"],
  "sports" => ["soccer", "cricket", "tennis", "baseball", "rugby"]
}

# Create a Hangman game instance and start
game = Hangman.new(categories)
game.start_game
