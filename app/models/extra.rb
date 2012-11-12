class Extra < ActiveRecord::Base
  include PriceAwareness
  attr_accessible :metascore, :name, :release_date, :extra_type,:url,:extra_type
  has_many :prices, :as => :buyable
  belongs_to :game

  def find_game_belongs_to
    nameArray = name.split
    my_game = nil
    nameArray.each do |i|
      nameArray.pop
      my_game = Game.where("name LIKE '#{nameArray.join(" ")}'")
      break if my_game
    end
    game = my_game
  end

end
