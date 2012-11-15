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
  end

end
