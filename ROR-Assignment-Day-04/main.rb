require_relative 'loan_eligibility'
require_relative 'economic_analysis'
require_relative 'military_defense'
require_relative 'debt_gdp_ratio'
require 'active_support/core_ext/string'


class LoanEligibilityTool
  include DebtGdpRatio
  include LoanEligibility
end

class EconomicAnalysisTool
  include DebtGdpRatio
  include EconomicAnalysis
end

class MilitaryAndDefenseAnalysis
  include MilitaryAndDefense
end

def economic_analysis_tool
  puts "Economic Analysis Tool"
  
  print "Enter the country name: "
  country_name = gets.chomp.squish.titleize
  
  print "Enter GDP: "
  gdp = gets.chomp.to_f
  
  print "Enter Debt: "
  debt = gets.chomp.to_f
  
  print "Enter Initial Price (of goods/services): "
  initial_price = gets.chomp.to_f
  
  print "Enter Final Price (of goods/services): "
  final_price = Integer(gets.chomp)
  
  print "Enter the number of years over which inflation occurred: "
  years = Integer(gets.chomp)
  
  print "Enter Total Exports: "
  exports = gets.chomp.to_f
  
  print "Enter Total Imports: "
  imports = gets.chomp.to_f
  
  # Display analysis details
  economic_analysis = EconomicAnalysisTool.new
  puts economic_analysis.details(country_name, gdp, debt, initial_price, final_price, years, exports, imports)
rescue => e
  puts "Error: #{e.message}"
end

def military_and_defense_analysis_tool
  puts "Military and Defense Analysis Tool"
  
  print "Enter the country name: "
  country_name = gets.chomp.squish.titleize
  
  print "Enter Defense Budget: "
  defense_budget = gets.chomp.to_f
  
  print "Enter GDP: "
  gdp = gets.chomp.to_f
  
  print "Enter Global Military Rank: "
  rank = Integer(gets.chomp)
  
  print "Enter Total Number of Countries: "
  total_countries = Integer(gets.chomp)
  
  print "Enter Total Cybersecurity Incidents Reported: "
  total_incidents = Integer(gets.chomp)
  
  print "Enter Number of Resolved Cybersecurity Incidents: "
  resolved_incidents = Integer(gets.chomp)
  
  # Display analysis details
  military_analysis = MilitaryAndDefenseAnalysis.new
  puts military_analysis.details(country_name, defense_budget, gdp, rank, total_countries, total_incidents, resolved_incidents)
rescue => e
  puts "Error: #{e.message}"
end

def loan_eligibility_tool
  puts "Loan Eligibility Tool"
  
  print "Enter the country name: "
  country_name = gets.chomp.squish.titleize
  
  print "Enter the GDP: "
  gdp = Integer(gets.chomp)
  
  print "Enter the Debt: "
  debt = Integer(gets.chomp)
  
  # Example of usage:
  loan = LoanEligibilityTool.new
  puts loan.details(country_name, gdp, debt)  # Adjust the values as needed
rescue => e
  puts "Error: #{e.message}"
end

def main
  puts "Analysis Loan Tool"

  loop do
    puts "************ 🚀 Program Start 🚀 ************"
    puts "Choose the tool you want to use: "
    print "1. Economic Analysis Tool\n2. Military and Defense Analysis Tool\n3. Loan Eligibility Tool\n4. Exit\n"
    choice = Integer(gets.chomp)

    case choice
    when 1
      economic_analysis_tool
    when 2
      military_and_defense_analysis_tool
    when 3
      loan_eligibility_tool
    when 4
      puts "Exiting..."
      break
    else
      puts "Invalid choice."
    end
  end
end

main