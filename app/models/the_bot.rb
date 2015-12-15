
require 'pry'
class TheBot

attr_reader :candlesticks

 def initialize(candlesticks)
   @candlesticks =  candlesticks
 end

 def decide
   buy if candlesticks_pattern
 end

  def candlesticks_pattern
   return false if candlesticks.count != 3
   return true if candlesticks[0]== :bear && candlesticks[1] == :bull && candlesticks[2]== :indecisive
  end

  def push_candlestick(candlestick)
      candlesticks << candlestick
      if candlesticks.length > 3
       candlesticks.shift
      end
  end

  def buy
    "buy" # tell API to buy
  end

end

binding.pry
