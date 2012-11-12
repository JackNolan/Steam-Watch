class AddSteamIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :steam_id, :integer
  end
end
