require_relative '../lib/ROQTI'

#Exercise 1

describe InterestRates,"#Annualized_interest_rate" do
  it "should return the annualized rate of an investment for a gross rate of 10% for the time period between 30 November 2006 and 1 March 2008" do
    #Y + m/12 + D/360 = periods
    periods = (1 + (2/12) + (29/360))
    return InterestRates.annualized_interest_rate(0.10, periods)
  end
end
    

#Exercise 2.1

describe InterestRates,"#savings_account" do
  it "should return the gross annual interest rate" do
    capital = 1000
    interest = 40
    InterestRates.gross_interest_rate(interest, capital).should eq(0.04)
  end
end

#ex 2.2

describe InterestRates,"#savings_account" do
  it "should return the amount of interest for 2006" do
    capital = 1040
    rate = 0.04
    periods = 12
    InterestRates.interest_paid(capital, rate, periods).should eq(41.6)
  end
end

#Ex 2.3

describe InterestRates,"#savings_account" do 
  it "should return interest in july 2005" do
    capital = 1000
    rate = 0.04
    periods = 6
    InterestRates.interest_paid(capital, rate, periods).should eq(19.8)
  end
end

#Ex 3

describe InterestRates,"#savings_account" do
  it "should return the savings amount in 10 years" do
    capital = 500
    periods = 10
    interest = 530.52
    InterestRates.future_balance(capital, interest, periods).should eq(2124)
  end
end

#Ex 8

describe InterestRates,"#present_value" do
  it "should return present values" do
    a_capital = 100000
    a_period =  1
    b_capital = 1000000
    b_period = 10
    c_capital = 100000
    c_period = -10
    rate = 0.04
    InterestRates.present_value(a_capital, a_period, rate).should eq(96154)
    InterestRates.present_value(b_capital, b_period, rate).should eq(675564)
    InterestRates.present_value(c_capital, c_period, rate).should eq(148024)
  end
end
