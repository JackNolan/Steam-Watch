class CreatePriceHistroys < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :game_id
      t.decimal :ammount
      t.date :start_date
      t.timestamps
    end
  end
end
