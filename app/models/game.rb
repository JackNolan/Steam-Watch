class Game < ActiveRecord::Base
  include PriceAwareness
  attr_accessible :metascore, :name, :release_date,:url, :steam_id
  has_many :prices, :as => :buyable
  has_many :extras

end
