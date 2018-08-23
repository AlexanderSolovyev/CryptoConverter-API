class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :symbol, index: true
      t.float :price
      t.timestamps
    end
  end
end
