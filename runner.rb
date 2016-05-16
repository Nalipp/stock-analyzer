require_relative 'stock_quote'

def stock_price_selector(symbol_array)
  symbol_array.each do |symbol|
    stock_price = StockQuote.price_by_symbol(symbol)
    stock_written = StockQuote.write_price_by_symbol(symbol, stock_price)
  end
end

stock_symbols = %w(GOOG MSFT AAPL)
stock_price_selector(stock_symbols)
