class SetUpPriceWithAPolymorphicInterface < ActiveRecord::Migration
  def up
    remove_column :prices, :game_id
    add_column :prices, :buyable_id, :integer
    add_column :prices, :buyable_type, :string
  end

  def down
    remove_column :prices, :buyable_id
    remove_column :prices, :buyable_type 
    add_column :prices, :game_id, :integer
  end
end
