class CreateAdditionalContents < ActiveRecord::Migration
  def change
    create_table :additional_contents do |t|
      t.string :name
      t.date :release_date
      t.integer :metascore

      t.timestamps
    end
  end
end
