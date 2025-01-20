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
