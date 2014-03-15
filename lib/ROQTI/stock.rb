class Stock < Security # i've made this a subclass of asset... that may or may not be a good thing
  def initialize(ticker_symbol, num_shares = 0)
    super(ticker_symbol, num_shares)
  end

  
  def refresh_data(source_file)
    @data_handler.refresh(source_file)
  end



  def ticker_symbol()
    return @ticker_symbol
  end
  
  def to_s()
    return "#{@ticker_symbol}:\t#{@num_shares}"
  end  
  
end

