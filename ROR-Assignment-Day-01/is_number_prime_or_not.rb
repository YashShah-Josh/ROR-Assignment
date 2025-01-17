def is_number_prime_or_not(number)
  # n=number
  #check if the number is 0, 1 or a negative number
  count = 0
  if number == 1 or number == 0
    return "Number is nor a Prime nor a composite"
  elsif number<0
    return "Enter a positive number greater than 1"
  end
  #loop to check if the number is prime or not
  #run till the square root of the number to reduce the number of iterations
  for i in 2..Math.sqrt(number) do
    if number%i == 0 
      count += 1
#      print(i)
    end
  end
  #number is prime if the count is 0 else it is not a prime number
  count == 0 ? "Prime Number" : "Not a Prime Number"
end

print "Enter a number:"
#Input from the user
number = gets.strip
#use match? to check if the input is a number
if number.match?(/^\d+$/)
#print("Test:", number)
#if the input is a number, call the function to check if the number is prime or not
  puts is_number_prime_or_not(number.to_i)
else
  puts "Enter a valid input"
end
