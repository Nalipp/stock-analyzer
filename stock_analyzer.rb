require 'csv'

class StockAnalyzer
  def self.symbol_lookup(file_name)
    begin
      data_path = File.dirname(__FILE__) + "/data/historical_stock_prices/#{file_name}"
      CSV.read(data_path)
    rescue StandardError => e
      puts e
    end
  end

  def self.average_price(symbol)
    quotes = symbol_lookup(symbol)
    prices = quotes.map do |quote|
      quote[1].to_f
    end
    analysis = prices.inject(:+) / quotes.size
    analysis.round(2)
  end
end

# puts StockAnalyzer.symbol_lookup("GOOG-251day.csv")
puts StockAnalyzer.average_price("GOOG-251day.csv")
