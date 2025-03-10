# Define module DebtGdpRatio
module DebtGdpRatio
    # Define method debt_gdp_ratio
    def self.debt_gdp_ratio(gdp, debt)
      return 'GDP cannot be zero' if gdp == 0
      (debt.to_f / gdp.to_f) * 100
    end
end
