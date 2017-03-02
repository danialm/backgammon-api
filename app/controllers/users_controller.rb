class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate_user, only: [:update, :show], raise: false
  before_action :create_user, only: [:create]
  before_action :set_users, only: [:index]
  before_action :update_user, only: [:update]

  def update
    render json: current_user, status: :ok
  end

  def index
    render json: @users.map(&:to_hash), status: :ok
  end

  def create
    render json: {}, status: :created
  end

  def show
    render json: current_user.to_hash, status: :ok
  end

  private

  def update_user
    result = current_user.update_attributes user_params
    unless result
      render json: user.errors.full_messages, status: :bad_request
    end
  end

  def set_users
    @users = User.all
  end

  def create_user
    user = User.create user_params

    unless user.errors.blank?
      render json: user.errors.full_messages, status: :bad_request
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
