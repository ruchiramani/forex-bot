require 'pry'
class TheBot

attr_reader :candlesticks

 def initialize
   @candlesticks = []
 end

 def decide
  if candlesticks_pattern
    puts "The time is:"
    puts Time.now
    puts "sending buy instruction to broker..."
     buy
  else
    puts "The time is:"
    puts Time.now
    puts "not buying today..."
  end
 end

  def candlesticks_pattern
   return false if candlesticks.count != 3
   return true if candlesticks[0]== :bear && candlesticks[1] == :bull && candlesticks[2]== :indecisive
  end

  def buy
    "buy" # tell API to buy
  end

  def push_candlestick(candlestick)
        @candlesticks << candlestick
        if @candlesticks.length > 3
         @candlesticks.shift
        end
  end

  def pull_candlestick(scraper)
      type = Candlestick.new(scraper.rates_now).type
      push_candlestick(type)
  end

end

#binding.pry
