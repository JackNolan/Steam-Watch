class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.decimal :price
      t.integer :metascore
      t.string :name
      t.date :release_date

      t.timestamps
    end
  end
end
