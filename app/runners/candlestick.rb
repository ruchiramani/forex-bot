
require 'pry'
class Candlestick

  attr_reader :last, :open, :high, :low

 def initialize(rates_hash)
  @rates_hash = rates_hash
  @last =  rates_hash[:last]
  @open = rates_hash[:open]
  @high = rates_hash[:high]
  @low = rates_hash[:low]
 end

  def type_of_candlestick
    return :bear if open > last && (high*open) < (open*last) && (low*last) < (open*last)
    return :bull if open < last && (high*last) < (open*last) && (low*open) < (open*last)
    return :indecisive
  end
end

day = Candlestick.new({:last=>1.5138, :open=>1.5142, :high=>1.5133, :low=>1.0984})
day.type_of_candlestick
binding.pry
