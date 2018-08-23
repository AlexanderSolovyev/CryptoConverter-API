class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string  :symbol1
      t.integer :amount1
      t.string  :symbol2
      t.integer :amount2

      t.timestamps
    end
  end
end
