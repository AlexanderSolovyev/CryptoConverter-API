class ChangeColumnTypeCurrencies < ActiveRecord::Migration[5.2]
  def change
    change_column :cryptocurrencies, :cryptocurrency_id, :string
  end
end
