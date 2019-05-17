class Games::OfferController < ApplicationController
  before_action :set_game

  def create
    @game.update offer: offer_params[:load]
    render json: {}, status: :ok
  end

  private

  def set_game
    @game = Games.find offer_params[:game_id]
    render :json ['game'], status: :not_found unless @game
  end

  def offer_params
    params.require(:game_id).permit(:load)
  end
end
