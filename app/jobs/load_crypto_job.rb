require 'open-uri'
require 'nokogiri'
class LoadCryptoJob < ApplicationJob
  queue_as :default

  def perform
    @cmc = Nokogiri::HTML.parse(open('https://coinmarketcap.com/all/views/all/'))
    load_cryptocurrencies
    load_currencies
  end

  def load_currencies
    cur=@cmc.search('div#currency-exchange-rates')[0].to_a[1..-1]
    cur.each do |data_currency, price|
      cur_symbol = data_currency[5..-1]
      currency = Currency.find_or_create_by(:symbol => cur_symbol)
      currency.update_attribute(:price, price) if currency.price != price
    end
  end

  def load_cryptocurrencies
    tab = @cmc.search('table#currencies-all tbody tr')
    tab.each do |tr|
      crypto_id = tr.attr('id')[3..-1]
      tds = tr.search('td')
      begin
        crypto_price = tds[4].search('a.price').attr('data-usd').to_s
      rescue
        crypto_price = '?'
      end
      crypto_symbol = tds[1].search('a')[0].text.strip
      crypto_name = tds[1].search('a')[1].text.strip
      cryptocurrency = Cryptocurrency.find_or_create_by(:cryptocurrency_id => crypto_id) do |c|
        c.name = crypto_name
        c.symbol = crypto_symbol
      end
      cryptocurrency.update_attribute(:price, crypto_price) if cryptocurrency.price != crypto_price
    end
  end
end
