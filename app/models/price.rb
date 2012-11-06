class Price < ActiveRecord::Base
  attr_accessible :game_id, :ammount, :start_date
  belongs_to :buyable, :polymorphic => true
end
