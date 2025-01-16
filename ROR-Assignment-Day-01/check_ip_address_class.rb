def get_ip_class(ip_address)
  # Split the IP address into its octets
  octets = ip_address.split('.')

  # Ensure that the IP address consists of exactly 4 octets
  return "Invalid IP address format" if octets.length != 4

  # Convert the first octet to an integer
  first_octet = Integer(octets[0])

  # Determine the class based on the first octet
  if first_octet >= 0 && first_octet <= 127
    return "Class A"
  elsif first_octet >= 128 && first_octet <= 191
    return "Class B"
  elsif first_octet >= 192 && first_octet <= 223
    return "Class C"
  elsif first_octet >= 224 && first_octet <= 239
    return "Class D (Multicast)"
  elsif first_octet >= 240 && first_octet <= 255
    return "Class E (Reserved)"
  else
    return "Invalid IP address"
  end
end

# Test the function
print "Enter an IP address: "
ip = gets.chomp
ip_class = get_ip_class(ip)
puts "The IP address #{ip} belongs to #{ip_class}."

