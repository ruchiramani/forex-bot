require_relative 'timer'
require_relative '../models/the_bot'
require_relative '../models/candlestick'
require_relative '../data_fetchers/fxstreet'


puts "Inside the daemon..."


scraper = FXStreetScraper.new
bot = TheBot.new
t = Timer.new(0,bot)
t.start
