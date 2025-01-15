def is_number_prime_or_not(number)
  n=number
  count = 0
  if n == 1 or n == 0
    return "Number is nor a Prime nor a composite"
  elsif n<0
    return "Enter a positive number greater than 1"
  end

  for i in 2..Math.sqrt(n) do
    if n%i == 0 
      count += 1
#      print(i)
    end
  end
  if count == 0
    result = "Prime Number"
  else
    result = "Not a Prime Number"
  end

  return result
end

print "Enter a number:"

number = gets.strip
if number.match?(/^\d+$/)
#print("Test:", number)
  puts is_number_prime_or_not(number.to_i)
else
  puts "Enter a valid input"
end
