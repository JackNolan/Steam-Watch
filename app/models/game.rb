class Game < ActiveRecord::Base
  include PriceAwareness
  attr_accessible :metascore, :name, :release_date,:url, :steam_id
  has_many :prices, :as => :buyable
  has_many :extras
  def self.all_with_price
    Game.includes(:prices).first.prices
  end
end
