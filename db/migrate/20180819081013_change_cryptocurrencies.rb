class ChangeCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    remove_column :cryptocurrencies, :history_id
    add_column :cryptocurrencies, :cryptocurrency_id, :integer, index: true 
  end
end
