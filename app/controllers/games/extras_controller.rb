class Games::ExtrasController < ApplicationController

  def index
    @extras = Extra.find_all_by_game_id params["game_id"]
  end
  def show
    @extra = Extra.find params["id"]
  end
end
