class GamesController < ApplicationController
  before_action :authenticate_user
  before_action :set_user_games, only: [:index]
  before_action :set_opponent, only: [:create]

  def index
    render json: @user_games, status: :ok
  end

  def create
    game = current_user.games.create game_params
    game.user_games.first.update_attributes accepted: true
    game.users << @opponent
    render json: game, status: :ok
  end

  private

  def set_user_games
    @user_games = current_user.user_games.map do |ug|
      {
        name: ug.game.try(:name) || 'no-name',
        accepted: ug.accepted,
        game_id: ug.game_id,
        game_url: game_url(ug.game_id),
        users: ug.users(current_user)
      }
    end
  end

  def set_opponent
    @opponent = User.find_by opponent_params

    render json: 'User not found', status: 404 if @opponent.blank?
  end

  def game_params
    params.require(:game).permit(:name)
  end

  def opponent_params
    params.require(:game).permit(:email)
  end
end
