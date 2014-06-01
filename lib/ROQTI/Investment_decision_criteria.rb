class InvestmentDecisionCriteria
  
  def self.rate_of_return(initial_price, current_price, income=0)
    return (current_price.to_f + income) / initial_price
  end

  def self.time_of_return(initial_price, current_price)
    return (initial_price.to_f/ (current_price - initial_price))
  end

  def self.net_present_value(initial_investment, number_of_periods, interest_rate, cash_flow )
    npv = -initial_investment.to_f
    sum = 0
    if cash_flow.length != number_of_periods
      for t in (0..number_of_periods-1).to_a
          sum += cash_flow[0].to_f/((1 + interest_rate) ** (t+1) )
      end
    else #it's a well-formed list of yearly cashflows
      for t in (0..number_of_periods-1).to_a
          sum += cash_flow[t].to_f/((1 + interest_rate) ** (t+1) )
      end
    end
    return  npv + sum

  end

  def self.internal_rate_of_return(initial_investment, number_of_periods, cash_flow)
    # "The IRR is the solution rate r to the equation NPV(r) = 0
    interest_rate = 1.0
    npv = net_present_value(initial_investment, number_of_periods, interest_rate, cash_flow)
    converging = true
    while converging
      new_rate = interest_rate - 0.01
      #puts "Interest Rate: #{new_rate}"
      new_npv = net_present_value(initial_investment, number_of_periods, new_rate, cash_flow)
      #puts "NPV: #{new_npv}"
      if new_npv.abs < npv.abs && new_rate >= 0.0 
        #npv must approach zero
        interest_rate = new_rate
        npv = new_npv
      else
        converging = false
      end
    end
    return interest_rate
  end

end

puts InvestmentDecisionCriteria.rate_of_return(100, 117, 5)
puts InvestmentDecisionCriteria.rate_of_return(90, 105)
puts InvestmentDecisionCriteria.time_of_return(90, 105)

puts InvestmentDecisionCriteria.net_present_value(10, 4, 0.04, [1])
puts InvestmentDecisionCriteria.net_present_value(400, 4, 0.1, [100, -150, 200, 500])
puts InvestmentDecisionCriteria.internal_rate_of_return(400, 4, [100, -150, 200, 500])
