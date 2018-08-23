class ChangeFloatPriceToStingCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    change_column :currencies, :price, :string
  end
end
