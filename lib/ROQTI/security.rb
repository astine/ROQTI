class Security
  def initialize(data_source, ticker_symbol, num_shares =  0)
    @ticker_symbol = ticker_symbol
    @data_source = data_source
    @num_shares_in_brokerage = num_shares
    @assets = {}
  end
  
  def add_shares_to_brokerage(num_shares)
    @num_shares_in_brokerage += num_shares
  end

  def attach_to_asset(asset)
    @assets[asset.portfolio_object.name] = asset

  end

  def show_security_owners()
    for asset in @assets.keys
      puts "#{@assets[asset].portfolio_object.name} -> #{@assets[asset].quantity}"
    end
  end

  def num_shares_in_brokerage()
    return "Brokerage -> #{@ticker_symbol}: #{@num_shares_in_brokerage}"
  end
  
  def day_closing_price(year, month, day)
    return @data_source.retrieve(@ticker_symbol, year, month, day)["close"].to_f
  end
  
end
