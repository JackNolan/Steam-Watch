class AddUrlToExtras < ActiveRecord::Migration
  def change
    add_column :extras, :url, :string
  end
end
