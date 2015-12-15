require_relative 'timer'
require_relative '../models/the_bot'
require_relative '../models/candlestick'
require_relative '../data_fetchers/fxstreet'
require_relative 'io'

puts "Inside the daemon..."

f = ForexIO.new("params.yml")
p = f.read
trading_time = p[:trading_time].to_i


scraper = FXStreetScraper.new
bot = TheBot.new
t = Timer.new(trading_time,bot)
t.start
