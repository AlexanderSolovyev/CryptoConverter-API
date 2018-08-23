class ChangeFloatToStringHistory < ActiveRecord::Migration[5.2]
  def change
    change_column :histories, :amount1, :string
    change_column :histories, :amount2, :string
  end
end
