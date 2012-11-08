class Extra < ActiveRecord::Base
  attr_accessible :metascore, :name, :release_date
  has_many :prices, :as => :buyable
  belongs_to :game
end
