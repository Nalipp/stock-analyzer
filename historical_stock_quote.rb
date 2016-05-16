require 'yahoo-finance'
require 'csv'

class HistoricalQuote

  def self.historical_price_by_symbol(symbol, days_ago)
    yahoo_client = YahooFinance::Client.new
    data = yahoo_client.historical_quotes("AAPL", { start_date: Time::now-(24*60*60*days_ago), end_date: Time::now })
    data.map { |data| [data.trade_date, data.open] }  # data.map!(&:open)
  end

  def self.write_historical_price(symbol, historical_price)
    number_of_days = historical_price.length
    data_path = File.dirname(__FILE__) + "/data/historical_stock_prices/#{symbol}-#{number_of_days}day.csv"
    CSV.open(data_path, "w") do |file|
      historical_price.each do |quote|
        file << quote
      end
    end
  end

  def self.delete_historical_price(symbol, historical_price)
    data_path = File.dirname(__FILE__) + "/data/historical_stock_prices/#{symbol}-#{historical_price}day.csv"
    File.delete(data_path)
  end
end
