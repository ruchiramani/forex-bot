require 'pry'

class Timer

 @@sleep = 5

 attr_reader :trading_time :bot

 def initialize(trading_time,bot)
   @bot = bot
   t = Time.now
   t = t - t.sec
   t = t - (t.min*60)
   t = t - (t.hour*3600)
   t = t + (trading_time*3600)
   @trading_time = t
   add_day
 end

 def start
   loop do
     sleep @@sleep
     now = Time.now
     if now > trading_time
       act
       add_day
     end
   end
 end

 def add_day
   @trading_time += (3600*24)
 end

 def act
   puts "waking up the bot..."
   @bot.decide
 end

end

binding.pry
