# Define module DebtGdpRatio
module DebtGdpRatio
    # Define method debt_gdp_ratio
    def self.debt_gdp_ratio(gdp, debt)
      (debt / gdp) * 100
    end
end
  
# Define module LoanEligibility
module LoanEligibility
    # IMF members list
    IMF_MEMBERS = [
      "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", 
      "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", 
      "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", 
      "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", 
      "Brazil", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", 
      "Cabo Verde", "Cambodia", "Cameroon", "Canada", "Central African Republic", 
      "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Congo, Democratic Republic of the", 
      "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", 
      "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", 
      "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini", 
      "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", 
      "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", 
      "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", 
      "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", 
      "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", 
      "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", 
      "Kyrgyzstan", "Lao People's Democratic Republic", "Latvia", "Lebanon", 
      "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", 
      "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", 
      "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia (Federated States of)", 
      "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", 
      "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", 
      "Nicaragua", "Niger", "Nigeria", "North Macedonia", "Norway", "Oman", 
      "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", 
      "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russian Federation", 
      "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", 
      "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", 
      "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovak Republic", 
      "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Sudan", 
      "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", 
      "Syrian Arab Republic", "Taiwan", "Tajikistan", "Tanzania", "Thailand", 
      "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", 
      "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", 
      "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", 
      "Venezuela", "Viet Nam", "Yemen", "Zambia", "Zimbabwe"
    ]
  
    # Check if the country is an IMF member
    def is_imf_member?(country_name)
      IMF_MEMBERS.include?(country_name)
    end
  
    # Debt sustainability based on GDP and debt ratio
    def debt_sustainability(country_name, gdp, debt)
      if is_imf_member?(country_name)
        dept_gdp_ratio = DebtGdpRatio.debt_gdp_ratio(gdp, debt)
        dept_gdp_ratio <= 60
      else
        "Country is not a member of IMF"
      end
    end
  
    # Check if the country is committed to reforms
    def commitment_to_reforms(country_name)
      is_imf_member?(country_name) ? true : false
    end
  
    # Determine loan eligibility based on GDP and debt sustainability
    def loan_eligibility(country_name, gdp, debt)
      if is_imf_member?(country_name)
        debt_sustainability(country_name, gdp, debt) && commitment_to_reforms(country_name) ? "Loan is approved" : "Loan is not approved"
      else
        "Country is not a member of IMF"
      end
    end
  
    # Call loan eligibility method (for easier access)
    def details(country_name, gdp, debt)
      loan_eligibility(country_name, gdp, debt)
    end
  end

class LoanEligible 
  include LoanEligibility

# Start of the main logic with rescue for invalid input
begin
  puts "Loan Eligibility Tool"
  
  print "Enter the country name: "
  country_name = gets.chomp.split.map(&:capitalize).join(' ')

  print "Enter the GDP: "
  gdp = Integer(gets.chomp)

  print "Enter the Debt: "
  debt = Integer(gets.chomp)

  # Example of usage:
  loan = LoanEligible.new
  puts loan.details(country_name, gdp, debt)  # Adjust the values as needed

rescue Error => e
  puts "Error: #{e.message}"
end
end
