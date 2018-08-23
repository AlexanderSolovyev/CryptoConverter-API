class ChangeCryprocurrenyPriceType < ActiveRecord::Migration[5.2]
  def change
    change_column :cryptocurrencies, :price, :string

  end
end
