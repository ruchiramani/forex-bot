require 'pry'

require 'nokogiri'
require 'rest-client'





class FXStreetScraper

  attr_reader :rates, :date

  def initialize
    @date = Time.now
    @rates = self.rates_now
    # @rates
  end

  def rates_now(url = "http://www.fxstreet.com/rates-charts/forex-rates/")

    html = RestClient.get(url)
    doc = Nokogiri::HTML(html)

    # prices = doc.css(".table-ttpushrates.table-rates").css(".ttratescaglink").css("td")[3].text
    prices = doc.css(".table-ttpushrates.table-rates").css(".ttratescaglink").css("td")

    prices_hash = {}
    prices[1..4].each do |price|
      #  binding.pry
      id = price.attribute("id").value
      type = id.scan(/^(\w+)_/).flatten.first
      value = price.text.to_f
      prices_hash[type.to_sym] = value
    end
    prices_hash

  end

end


binding.pry
