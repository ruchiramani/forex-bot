require 'pry'

require_relative 'timer'
require_relative '../models/the_bot'
require_relative '../models/candlestick'
require_relative '../data_fetchers/fxstreet'


def quit
  puts "quitting the trading cli..."
  exit
end

def message
  puts "Please choose from the below options:"
  puts "-------------------------------------"
  puts "attempt: Tell the trading bot to attempt a sigle trade"
  puts "daemon: Start deamon for periodic trading"
  puts "print: Show the current Rates"
  puts "quit: Exit the trading cli"
  puts "help: Show options"
  puts "time: Select time of day for periodic trading"
  puts "-------------------------------------"
  puts
end

def print_rates(rates_hash)
  rates_hash.each do |name,price|
    puts "#{name.to_s}: #{price}"
  end
end


def attempt_trade(scraper)
  data_hash = scraper.rates_now
  new_candle = Candlestick.new(data_hash)
  new_bot = TheBot.new
  new_bot.push_candlestick(new_candle.type)
  new_bot.decide
end

def get_time
  puts "Enter time of day for periodic trading"
  gets.chomp.to_i
end


def runner

  message
  scraper = FXStreetScraper.new
  time = 0

  loop do

    response = gets.chomp
    case response
    when "help"
      message
    when "attempt"
      attempt_trade(scraper)
    when "quit"
      quit
    when "print"
      print_rates(scraper.rates_now)
    when "daemon"
      puts "Starting daemon"
      `ruby daemon.rb > log`
    when "time"
      puts "Current trading time is set at #{time}"
      time =  get_time
    else
      puts "invalid command!"
      help
    end
  end

end

runner

#day= FXStreetScraper.new
#binding.pry
