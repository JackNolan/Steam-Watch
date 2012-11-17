class GamesController < ApplicationController
  def index
    # @games = Game.all
    respond_to do |format|
      format.html
      format.json { render json: GamesDatatable.new(view_context)}
    end
  end
  def show
    @game = Game.find params[:id]
    respond_to do |format| 
      format.html
      format.json {render json: [@game.to_json,@game.prices.to_json,@game.extras]}
    end
  end

end
