class Game < ActiveRecord::Base
  attr_accessible :metascore, :name, :release_date
  has_many :prices
end
