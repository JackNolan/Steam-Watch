class Extra < ActiveRecord::Base
  include PriceAwareness
  attr_accessible :metascore, :name, :release_date, :extra_type,:url
  has_many :prices, :as => :buyable
  belongs_to :game


end
