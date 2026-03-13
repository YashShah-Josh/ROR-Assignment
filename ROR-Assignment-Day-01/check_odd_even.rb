def odd_or_even(number)
  return "Zero is neither odd nor even" if number.zero?
  number.even? ? "Even" : "Odd"
end

print "Enter a number: "
input = gets.strip

if input.match?(/^-?\d+$/)
  number = input.to_i
  puts odd_or_even(number)
else
  puts "Please enter a valid integer"
end

