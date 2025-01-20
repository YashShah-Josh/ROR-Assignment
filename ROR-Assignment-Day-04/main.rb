require_relative 'loan_eligibility'
require_relative 'economic_analysis'
require_relative 'military_defense'

class AnalysisLoan
    include DebtGdpRatio
    include LoanEligibility
    include EconomicAnalysis
    include MilitaryAndDefense
end


    analysis_loan = AnalysisLoan.new

    puts "Analysis Loan Tool"

    puts "Choose the tool you want to use: "
    print "1. Economic Analysis Tool\n2. Military and Defense Analysis Tool\n3. Loan Eligibility Tool\n"
    choice = gets.chomp.to_i

    case choice
    when 1
        begin
            puts "Economic Analysis Tool"
          
            print "Enter the country name: "
            country_name = gets.chomp.split.map(&:capitalize).join(' ')
          
            print "Enter GDP: "
            gdp = gets.chomp.to_f
          
            print "Enter Debt: "
            debt = gets.chomp.to_f
          
            print "Enter Initial Price (of goods/services): "
            initial_price = gets.chomp.to_f
          
            print "Enter Final Price (of goods/services): "
            final_price = gets.chomp.to_f
          
            print "Enter the number of years over which inflation occurred: "
            years = gets.chomp.to_i
          
            print "Enter Total Exports: "
            exports = gets.chomp.to_f
          
            print "Enter Total Imports: "
            imports = gets.chomp.to_f
          
            # Display analysis details
            # economic_analysis = EconomicAnalysisTool.new
            puts analysis_loan.details(country_name, gdp, debt, initial_price, final_price, years, exports, imports)
          
          rescue => e
            puts "Error: #{e.message}"
          end
        # end
    when 2
        begin
            puts "Military and Defense Analysis Tool"
          
            print "Enter the country name: "
            country_name = gets.chomp.split.map(&:capitalize).join(' ')
          
            print "Enter Defense Budget: "
            defense_budget = gets.chomp.to_f
          
            print "Enter GDP: "
            gdp = gets.chomp.to_f
          
            print "Enter Global Military Rank: "
            rank = gets.chomp.to_i
          
            print "Enter Total Number of Countries: "
            total_countries = gets.chomp.to_i
          
            print "Enter Total Cybersecurity Incidents Reported: "
            total_incidents = gets.chomp.to_i
          
            print "Enter Number of Resolved Cybersecurity Incidents: "
            resolved_incidents = gets.chomp.to_i
          
            # Display analysis details
            # military_analysis = MilitaryAndDefenseAnalysis.new
            puts analysis_loan.details(country_name, defense_budget, gdp, rank, total_countries, total_incidents, resolved_incidents)
          
          rescue => e
            puts "Error: #{e.message}"
          end
        # end
    when 3
        begin
            puts "Loan Eligibility Tool"
            
            print "Enter the country name: "
            country_name = gets.chomp.split.map(&:capitalize).join(' ')
          
            print "Enter the GDP: "
            gdp = Integer(gets.chomp)
          
            print "Enter the Debt: "
            debt = Integer(gets.chomp)
          
            # Example of usage:
            # loan = LoanEligible.new
            puts analysis_loan.details(country_name, gdp, debt)  # Adjust the values as needed
          
          rescue Error => e
            puts "Error: #{e.message}"
          end
        # end
    else
        puts "Invalid choice"
    end