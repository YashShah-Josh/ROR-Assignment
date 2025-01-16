def get_ip_class(ip_address)
  # Split the IP address into its octets
  octets = ip_address.split('.')

  # Ensure that the IP address consists of exactly 4 octets
  return "Invalid IP address format" if octets.length != 4

  # Convert the first octet to an integer
  first_octet = Integer(octets[0])

  # Determine the class based on the first octet
  case first_octet
  when 0..127
    "The IP address #{ip} belongs to Class A"
  when 128..191
    "The IP address #{ip} belongs to Class B"
  when 192..223
    "The IP address #{ip} belongs to Class C"
  when 224..239
    "The IP address #{ip} belongs to Class D (Multicast)"
  when 240..255
    "The IP address #{ip} belongs to Class E (Reserved)"
  else
    "Invalid IP address #{ip}"
  end  
rescue StandardError => e
  "Invalid input, error message: #{e.message}"
end

# Test the function
print "Enter an IP address: "
ip = gets.chomp
ip_class = get_ip_class(ip)

puts ip_class
# if ip_class == "Invalid IP address format"
#   puts "#{ip} is not a valid IP address."
# else
# puts  #{ip_class}."
# end