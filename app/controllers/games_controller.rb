class GamesController < ApplicationController
  before_action :authenticate_user
  before_action :set_game, only: [:destroy, :update, :show]
  before_action :set_user_game, only: [:update]
  before_action :set_games, only: [:index]
  before_action :set_opponent, only: [:create]

  def index
    render json: @games, status: :ok
  end

  def show
    render json: @game.to_hash, status: :ok
  end

  def create
    game = Game.new game_params
    game.users << current_user
    game.save!
    game.user_games.first.update_attributes accepted: true
    game.users << @opponent
    render json: game.to_hash, status: :ok
  end

  def destroy
    @game.destroy
    render json: {}, status: :ok
  end

  def update
    @user_game.update_attributes game_params
    render json: @game.to_hash, status: :ok
  end

  private

  def set_game
    @game = Game.find_by id: params[:id]
    render json: ['game'], status: :not_found if @game.blank?
  end

  def set_user_game
    @user_game = @game.user_games.detect { |ug| ug.user_id == current_user.id }
    render json: ['No access'], status: :unauthorized if @user_game.blank?
  end

  def set_games
    @games = current_user.games.map { |g| g.to_hash }
  end

  def set_opponent
    @opponent = User.find_by opponent_params
    res = nil

    if @opponent.blank?
      res = { json: ['user'], status: :not_found }
    elsif @opponent.id == current_user.id
      res = { json: ['Unacceptable user'], status: :bad_request }
    end

    render res unless res.blank?
  end

  def game_params
    params.require(:game).permit(:name, :accepted, :status)
  end

  def opponent_params
    params.require(:game).permit(:email)
  end
end
