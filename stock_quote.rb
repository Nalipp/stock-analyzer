require 'yahoo-finance'
require "csv"

class StockQuote

  def self.price_by_symbol(symbol)
    client = YahooFinance::Client.new
    data = client.quotes([symbol], [:last_trade_price])
    data[0].last_trade_price
  end

  def self.write_price_by_symbol(symbol, price)
    data_path = File.dirname(__FILE__) + "/data/#{symbol}.csv"
    date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    File.open(data_path, "a") do |csv|

      csv << "#{date}, #{price}\n"
    end
  end
end
