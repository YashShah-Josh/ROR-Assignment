# Define module DebtGdpRatio
module DebtGdpRatio
    # Method to calculate debt-to-GDP ratio
    def self.debt_gdp_ratio(gdp, debt)
      return 'GDP cannot be zero' if gdp == 0
      (debt.to_f / gdp.to_f) * 100
    end
  end
  
  # Define module EconomicAnalysis
  module EconomicAnalysis
    # Method to analyze inflation rate
    def inflation_rate_analysis(initial_price, final_price, years)
      return 'Years cannot be zero' if years == 0
      ((final_price - initial_price) / initial_price.to_f) / years * 100
    end
  
    # Method to analyze trade balance
    def trade_balance_analysis(exports, imports)
      balance = exports - imports
      case balance
        when 0
            'Trade is Balanced'
        when 1..Float::INFINITY
            "Trade Surplus: #{balance}"
        when -Float::INFINITY..-1
            "Trade Deficit: #{balance.abs}"
        else
            'Invalid balance'
        end
    end
  
    # Method to provide details for a country
    def details(country_name, gdp, debt, initial_price, final_price, years, exports, imports)
      debt_gdp_ratio = DebtGdpRatio.debt_gdp_ratio(gdp, debt)
      inflation_rate = inflation_rate_analysis(initial_price, final_price, years)
      trade_balance = trade_balance_analysis(exports, imports)
  
      <<-DETAILS
  Country: #{country_name}
  Debt-to-GDP Ratio: #{debt_gdp_ratio}%
  Inflation Rate (per year): #{inflation_rate}%
  Trade Balance: #{trade_balance}
      DETAILS
    end
  end

  class EconomicAnalysisTool
    include EconomicAnalysis
  end

  # Main Program
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
    economic_analysis = EconomicAnalysisTool.new
    puts economic_analysis.details(country_name, gdp, debt, initial_price, final_price, years, exports, imports)
  
  rescue => e
    puts "Error: #{e.message}"
  end
  