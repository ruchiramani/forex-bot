


def Message
puts "Please choose from the below options"/n "Start the Bot"/n "Look at rates"/n "Exit"
end


def start_the_bot
  day= FXStreetScraper.new
 data_hash = day.rates_now
  new_candle = Candlestick.new(data_hash)
  type = new_candle.type_of_candlestick
  new_bot = TheBot.new(type)
  new_bot.decide

end
