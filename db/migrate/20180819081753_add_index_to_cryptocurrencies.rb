class AddIndexToCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    add_index :cryptocurrencies, :cryptocurrency_id
  end
end
