require 'pry'

class Timer

 @@sleep = 4

 attr_reader :trading_time, :bot

 def initialize(trading_time,bot)
   @bot = bot
   t = Time.now
   t = t - t.sec
   t = t + trading_time
#   t = t - (t.min*60)
#   t = t - (t.hour*3600)
#   t = t + (trading_time*3600)
   @trading_time = t
#   add_day
   add_minute
 end

 def start
   loop do
     sleep @@sleep
     now = Time.now
     puts "waiting ..."
     puts "next trade attempt at #{trading_time}"
     puts "time now is #{now}"
     if now > trading_time
       act
       add_day
     end
   end
 end

 def stop
   puts "stopping daemon..."
   exit
 end

 def add_day
   @trading_time += (3600*24)
 end

 def add_minute
   @trading_time += (60)
 end

 def act
   puts "waking up the bot..."
   @bot.pull_candlestick(FXStreetScraper.new)
   @bot.decide
 end

end
