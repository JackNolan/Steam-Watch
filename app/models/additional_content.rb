class AdditionalContent < ActiveRecord::Base
  attr_accessible :metascore, :name, :release_date
  has_many :prices, :as => :buyable

end
