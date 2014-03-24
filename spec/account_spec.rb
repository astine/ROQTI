require_relative '../lib/ROQTI'

describe Account do
  before :each do
    ted = Portfolio.new("Ted")
    goog = Stock.new("goog")
    yhoo = Stock.new("yhoo")
    ted.add_asset(goog, 5, 500)
    ted.add_asset(yhoo, 50, 26)
    @account = Account.new({:name => "Ted's Account", :portfolios => [ted]})
  end
  
  it 'should exist' do
    expect(@account).not_to be_nil
  end
  
  it 'should have the correct purchase value' do
    @account.purchase_value.should eq(3800)
  end

  it 'should report the current assets correctly' do
    #Some of these will fail because they're not implemented correctly
    @account.current_assets.should eq([goog, yhoo])
  end
  
  it 'should have the right gain' do
    #Some of these will fail because they're not implemented correctly
    @account.gain_on_day(2013,1,2).should eq(820.25)
  end

  it 'should report the total returns correctly' do
    #Some of these will fail because they're not implemented correctly
    time = Time.new
    @account.total_returns.should eq(@account.gain_on_day(time.year,time.month,time.day)- @account.purchase_value)
  end

  it 'should return the the correct account value' do
    #Some of these will fail because they're not implemented correctly
    time = Time.new
    @account.account_value.should eq(@account.gain_on_day(time.year,time.month,time.day))
  end

  it 'should have the correct printed representation' do
    @account.to_s.should eq("Ted's Account: 3800")
  end
end
