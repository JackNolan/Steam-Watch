class ChangeStartDateTypeInPrices < ActiveRecord::Migration
  def up
    change_column :prices, :start_date, :datetime
  end

  def down
    change_column :prices, :start_date, :date
  end
end
