$lives = 5

# Function to choose a random word and its category
def choose_random_category(categories)
  category = categories.keys.sample
  word = categories[category].sample
  [category, word]
end

# Main Hangman game function
def hangman(categories)
  category, guess_word = choose_random_category(categories)
  guessed_letters = ["_"] * guess_word.length
  guessed_set = []

  puts "\nWelcome to Hangman!"
  puts "\nThe word is from the category: #{category.capitalize}"
  puts "Guess the letters in the word!"

  while $lives > 0
    puts "\nYou have #{$lives} lives left."
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
      $lives -= 1
      puts "Wrong guess!"
    end

    # Check if the player has guessed the entire word
    if guessed_letters.join("") == guess_word
        puts guessed_letters.join(" ")
      puts "Congratulations! You won! The word was '#{guess_word}'."
      return
    end
  end

  puts "Game over! You lost. The word was '#{guess_word}'."
end

# Categories and their word lists
categories = {
  "fruits" => ["apple", "banana", "cherry", "mango", "orange"],
  "animals" => ["tiger", "elephant", "zebra", "giraffe", "kangaroo"],
  "countries" => ["india", "brazil", "canada", "germany", "japan"],
  "sports" => ["soccer", "cricket", "tennis", "baseball", "rugby"]
}

# Start the game
for i in 1..5
  if $lives == 0
    break
  end
  
  puts "\nLevel #{i}"
  hangman(categories)
end

