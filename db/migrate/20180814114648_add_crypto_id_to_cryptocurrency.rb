class AddCryptoIdToCryptocurrency < ActiveRecord::Migration[5.2]
  def change
    add_reference :cryptocurrencies, :history, foreign_key: true
  end
end
