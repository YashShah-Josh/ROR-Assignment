# Define module MilitaryAndDefense
module MilitaryAndDefense
    # Method to calculate defense spending as a percentage of GDP
    def defense_spending_analysis(defense_budget, gdp)
      return 'GDP cannot be zero' if gdp == 0
      (defense_budget.to_f / gdp.to_f) * 100
    end
  
    # Method to compare global military rank
    def global_military_rank_comparison(rank, total_countries)
      if rank > total_countries || rank <= 0
        "Invalid rank. Rank must be between 1 and #{total_countries}."
      else
        "Rank #{rank} out of #{total_countries} places the country in the top #{((rank.to_f / total_countries) * 100).round(2)}% globally."
      end
    end
  
    # Method to assess cybersecurity preparedness
    def cybersecurity_preparedness(total_incidents, resolved_incidents)
      return 'Total incidents cannot be zero' if total_incidents == 0
      resolution_rate = (resolved_incidents.to_f / total_incidents) * 100
      case resolution_rate
      when 90..100
        "Excellent preparedness with a resolution rate of #{resolution_rate.round(2)}%."
      when 70...90
        "Good preparedness with a resolution rate of #{resolution_rate.round(2)}%."
      when 50...70
        "Moderate preparedness with a resolution rate of #{resolution_rate.round(2)}%."
      else
        "Poor preparedness with a resolution rate of #{resolution_rate.round(2)}%."
      end
    end
  
    # Method to display full analysis
    def details(country_name, defense_budget, gdp, rank, total_countries, total_incidents, resolved_incidents)
      defense_spending = defense_spending_analysis(defense_budget, gdp)
      rank_comparison = global_military_rank_comparison(rank, total_countries)
      cybersecurity_status = cybersecurity_preparedness(total_incidents, resolved_incidents)
  
      <<-DETAILS
  Country: #{country_name}
  Defense Spending (% of GDP): #{defense_spending}
  Global Military Rank: #{rank_comparison}
  Cybersecurity Preparedness: #{cybersecurity_status}
      DETAILS
    end
  end
  class MilitaryAndDefenseAnalysis
    include MilitaryAndDefense
  end

  # Main Program
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
    military_analysis = MilitaryAndDefenseAnalysis.new
    puts military_analysis.details(country_name, defense_budget, gdp, rank, total_countries, total_incidents, resolved_incidents)
  
  rescue => e
    puts "Error: #{e.message}"
  end
  