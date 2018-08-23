class ChangeColumnTypeHistory < ActiveRecord::Migration[5.2]
  def change
    change_column :histories, :amount1, :float
    change_column :histories, :amount2, :float
  end
end
