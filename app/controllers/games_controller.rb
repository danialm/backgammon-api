class GamesController < ApplicationController
  before_action :authenticate_user

  def index
    render json: ['Game 1', 'Game 2', 'Game 3']
  end
end
