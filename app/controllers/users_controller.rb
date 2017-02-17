class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :create_user, only: [:create]

  def index; end

  def create
    render json: {}, status: 201
  end

  private

  def create_user
    user = User.create user_params

    unless user.errors.blank?
      render json: user.errors.full_messages, status: 406
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
