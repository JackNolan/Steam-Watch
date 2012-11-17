class AddCurrentPriceToGames < ActiveRecord::Migration
  def change
    add_column :games, :current_price, :decimal
  end
end
