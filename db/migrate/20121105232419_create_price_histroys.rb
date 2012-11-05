class CreatePriceHistroys < ActiveRecord::Migration
  def change
    create_table :price_histroys do |t|
      t.integer :game_id
      t.decimal :price
      t.date :start_date

      t.timestamps
    end
    remove_column :games, :price
  end
end
