class RemoveColumnGamesPrice < ActiveRecord::Migration
  def up
     remove_column :games, :price
  end

  def down
    add_column :games, :price, :integer
  end
end
