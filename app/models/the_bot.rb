require 'pry'
class TheBot

attr_reader :candlesticks

 def initialize(candlesticks)
   @candlesticks =  candlesticks
 end

 def decide
   buy if candlesticks_pattern(candlesticks)
 end

  def candlesticks_pattern(candlesticks)
   return false if candlesticks.count != 3
   return true if candlesticks[0]== :bear && candlesticks[1] == :bull && candlesticks[2]== :indecisive
  end

  def buy
    "buy" # tell API to buy
  end

end

binding.pry
