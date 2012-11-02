class Game < ActiveRecord::Base
  attr_accessible :metascore, :name, :price, :release_date
end
