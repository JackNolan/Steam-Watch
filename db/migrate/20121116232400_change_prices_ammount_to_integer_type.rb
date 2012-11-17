class ChangePricesAmmountToIntegerType < ActiveRecord::Migration
  def up
    change_column :prices, :ammount, :integer
    change_column :games, :current_price,:integer
  end

  def down
    change_column :prices, :ammount, :decimal
    change_column :games, :current_price,:decimal
  end
end
