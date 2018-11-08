require 'open-uri'

class CryptoScrapper

  def initialize(url)
    @url = url
  end

  def save
    Crypto.all.destroy_all
    @my_coin_hash.each do |name, price|
      Crypto.create(name: name, price: price)
    end 
  end 

  #DECLARATION DE LA METHODE = SEARCH NAME
  def get_name(page)
    web_object = page.css("a.currency-name-container.link-secondary")
    name_coin = [] #stocke les donnees dans nouvel array
    web_object.each { |link| puts name_coin << link.text }
    return name_coin
  end

  #DECLARATION DE LA METHODE = SEARCH PRICE
  def get_price(page)
    web_object = page.css("a.price")
    price_coin = [] #stocke les donnees dans nouvel array
    web_object.each { |link| puts price_coin << link["data-usd"] }
    return price_coin
  end

  #DECLARATION DE LA METHODE = PERFORM
  def perform
    #lien general
    page = Nokogiri::HTML(open(@url).read)
    name = get_name(page)
    price = get_price(page)
    @my_coin_hash = Hash[name.zip(price)]
    self.save
  end


# CryptoScrapper.new("https://coinmarketcap.com/all/views/all/").perform


end 