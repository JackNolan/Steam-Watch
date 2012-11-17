class Add < ActiveRecord::Migration
  def up
    add_column :extras, :current_price, :integer

  end

  def down
  end
end
