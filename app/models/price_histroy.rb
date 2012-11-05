class PriceHistroy < ActiveRecord::Base
  attr_accessible :game_id, :price, :start_date
  belongs_to :game
end
