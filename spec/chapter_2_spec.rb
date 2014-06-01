require_relative '../lib/ROQTI'

describe InvestmentDecisionCriteria, "#rate_of_return" do
  it "should give the rate of return" do
    current_price = 400
    initial_price = 350
    income = 0
    InvestmentDecisionCriteria.rate_of_return(initial_price, current_price, income).should eq(((current_price.to_f - initial_price) + income) / initial_price)
  end
end

describe InvestmentDecisionCriteria, "#rate_of_return" do
  it "should give the rate of return" do
    current_price = 20
    initial_price = 10
    income = 0
    InvestmentDecisionCriteria.rate_of_return(initial_price, current_price, income).should eq(((current_price.to_f - initial_price) + income) / initial_price)
  end
end

describe InvestmentDecisionCriteria, "#rate_of_return" do
  it "should give the rate of return" do
    current_price = 950
    initial_price = 1000
    income = 100
    InvestmentDecisionCriteria.rate_of_return(initial_price, current_price, income).should eq(((current_price.to_f - initial_price) + income) / initial_price)
  end
end

#describe InvestmentDecisionCriteria, "#time_of_return" do
 #it "should give time of return" do
  # periods = 1.5
   #rate_of_return = self.rate_of_return #not sure how to call on this
    #InvestmentDecisionCriteria.time_of_return(periods).should eq(1/(1 + (rate_of_return ** periods)) ** (1/periods) - 1)
  #end
#end

