class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.string :name
      t.date :release_date
      t.integer :metascore
      t.integer :game_id
      t.timestamps
    end
  end
end
