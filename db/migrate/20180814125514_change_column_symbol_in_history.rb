class ChangeColumnSymbolInHistory < ActiveRecord::Migration[5.2]
  def change
    remove_column :histories, :symbol1
    remove_column :histories, :symbol2
  end
end
