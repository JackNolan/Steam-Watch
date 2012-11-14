class Extra < ActiveRecord::Base
  include PriceAwareness
  attr_accessible :metascore, :name, :release_date, :extra_type,:url,:extra_type
  has_many :prices, :as => :buyable
  belongs_to :game

  def find_game_belongs_to
    words = name.gsub(/[^a-z0-9 ]/i,"").split
    my_game = nil
    while words.pop
      my_game = Game.where("name LIKE ?","#{words.join(" ")}%").first
      break if my_game || words.length == 1
     end
     my_game
  end

end
