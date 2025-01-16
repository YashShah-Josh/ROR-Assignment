def validate_input(input, regex)
  if input.match?(regex)
    puts "Valid input: #{input}"
  else
    puts "Invalid input: #{input}"
  end
end

# Test mobile number
print "Enter a mobile number: "
mobile_number = gets.chomp
validate_input(mobile_number, /^\+?\d{1,4}[-\s]?\(?\d{3}\)?[-\s]?\d{3}[-\s]?\d{4}$/)

# Test email address
print "Enter an email address: "
email = gets.chomp
validate_input(email, /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)

# Test name
print "Enter a name: "
name = gets.chomp
validate_input(name, /^[A-Za-z\s\-]+$/)

# Test gender
print "Enter gender (M/F): "
gender = gets.chomp.strip.upcase
validate_input(gender, /^[MF]$/)

# Test amount
print "Enter an amount: "
amount = gets.chomp
validate_input(amount, /^\$?\d{1,3}(?:,\d{3})*(?:\.\d{1,2})?$/)

