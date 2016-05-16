require_relative 'stock_quote'
require_relative 'historical_stock_quote'

def stock_price_selector(symbol_array)
  symbol_array.each do |symbol|
    stock_price = StockQuote.price_by_symbol(symbol)
    stock_written = StockQuote.write_price_by_symbol(symbol, stock_price)
  end
end

def historical_price_selector(symbol_array, days_ago)
  symbol_array.each do |symbol|
    historical_price = HistoricalQuote.historical_price_by_symbol(symbol, days_ago)
    stock_written = HistoricalQuote.write_historical_price(symbol, historical_price)
  end
end

# stock_symbols = %w(GOOG MSFT AAPL)
# stock_price_selector(stock_symbols)
# historical_price_selector(stock_symbols, 365)
# HistoricalQuote.delete_historical_price("GOOG", 20)
