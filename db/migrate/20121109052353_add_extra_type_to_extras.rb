class AddExtraTypeToExtras < ActiveRecord::Migration
  def change
    add_column :extras, :extra_type, :string
  end
end
