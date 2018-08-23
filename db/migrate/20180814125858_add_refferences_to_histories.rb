class AddRefferencesToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :currency1, :string
    add_column :histories, :currency2, :string
  end
end
