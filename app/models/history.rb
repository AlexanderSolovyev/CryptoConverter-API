require 'bigdecimal'
class History < ApplicationRecord
  validates :currency1, presence: true
  validates :currency2, presence: true
  validates :amount1, presence: true

  def convert
    cur1 = find_crypto self.currency1
    cur2 = find_crypto self.currency2
    self.amount2 = BigDecimal(BigDecimal(amount1.to_s) * (BigDecimal(cur1.price.to_s) / BigDecimal(cur2.price.to_s))).to_f.to_s rescue '?'
  end

  def find_crypto(currency)
     (Currency.find_by symbol: currency.downcase) || (Cryptocurrency.find_by symbol: currency.upcase)
  end
end
