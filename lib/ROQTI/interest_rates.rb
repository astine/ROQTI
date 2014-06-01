class InterestRates
  def self.gross_interest_rate(total_interest, capital)
    gross_interest_rate = total_interest.to_f / capital
    return gross_interest_rate
  end

  def self.basic_compound_interest_rate(capital, interest_rate, periods)
    return (capital.to_f * (1 + interest_rate) ** periods) - capital.to_f
  end

  def self.effective_compound_interest_rate(interest_rate, periods)
    return ((1 + interest_rate.to_f) ** periods) - 1
  end

  def self.present_value(amount_paid, periods, interest_rate)
    return amount_paid.to_f / (1 + interest_rate) ** periods
  end

  def self.annualized_interest_rate 
    #this should figure out the annualized interest rate of an investment, given the gross rate and periods of time
  end

  def self.future_balance
    #should figure out what you will have after a certain amount of periods
  end

end



puts InterestRates.gross_interest_rate(75, 20)
puts InterestRates.basic_compound_interest_rate(2000, 0.10, 2)
puts InterestRates.effective_compound_interest_rate(0.05, 6)
puts InterestRates.present_value(1000000, 0.25, 0.05)

