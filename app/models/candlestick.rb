
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

day = Candlestick.new({:last=>1, :open=>2, :high=>0.5, :low=>0.5})
day.type_of_candlestick
binding.pry
